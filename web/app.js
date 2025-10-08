(function () {
  var panelEl      = document.getElementById('panel');
  var titleEl      = document.getElementById('caseTitle');
  var iconEl       = document.getElementById('caseIcon');
  var rollerEl     = document.getElementById('roller');
  var rollerWrapEl = document.getElementById('rollerWrap');
  var btnOpen      = document.getElementById('btnOpen');
  var btnConfirm   = document.getElementById('btnConfirm');
  var btnClose     = document.getElementById('btnClose');
  var tick         = document.getElementById('tick1');
  var rewardSfx    = document.getElementById('rewardSfx');
  var winnerEl     = document.getElementById('winner');
  var shopModal = document.getElementById('shopModal');
  var shopList  = document.getElementById('shopList');
  var shopClose = document.getElementById('shopClose');

  var state = {
    spinning: false,
    payload: null,
    colors: {},
    idleList: []
  };

  function setHidden(el, h) { el.classList.toggle('hidden', !!h); }
  function nui(action, data) {
    return fetch('https://ug_case_opening/' + action, {
      method: 'POST',
      body: JSON.stringify(data || {})
    });
  }

  function makeTile(entry) {
    var el = document.createElement('div');
    el.className = 'tile';

    var rb = document.createElement('div');
    rb.className = 'ribbon';
    rb.textContent = entry.rarity || 'common';
    rb.style.background = state.colors[entry.rarity] || '#3b82f6';
    el.appendChild(rb);

    var img = document.createElement('img');
    if (entry.image) {
      img.src = 'nui://ox_inventory/web/images/' + entry.image;
    } else {
      img.src = 'nui://ox_inventory/web/images/' + entry.item + '.png';
    }
    img.alt = entry.name;
    el.appendChild(img);

    var nm = document.createElement('div');
    nm.className = 'name';
    nm.textContent = entry.name;
    el.appendChild(nm);

    return el;
  }

  function renderList(list) {
    rollerEl.innerHTML = '';
    for (var i = 0; i < list.length; i++) {
      rollerEl.appendChild(makeTile(list[i]));
    }
    rollerEl.style.transition = 'none';
    rollerEl.style.transform  = 'translateX(0px)';
    void rollerEl.offsetHeight;
  }

  function centerIndexNow(idx) {
    var contRect = rollerWrapEl.getBoundingClientRect();
    var contCenter = contRect.left + contRect.width / 2;
    var tile = rollerEl.children[idx];
    if (!tile) return 0;

    var tileRect = tile.getBoundingClientRect();
    var tileCenter = tileRect.left + tileRect.width / 2;

    var targetX = contCenter - tileCenter;
    rollerEl.style.transition = 'none';
    rollerEl.style.transform  = 'translateX(' + targetX + 'px)';
    void rollerEl.offsetHeight;
    return targetX;
  }

  function centerOffsetForIndex(idx) {
    rollerEl.style.transition = 'none';
    rollerEl.style.transform  = 'translateX(0px)';
    void rollerEl.offsetHeight;

    var contRect = rollerWrapEl.getBoundingClientRect();
    var contCenter = contRect.left + contRect.width / 2;
    var tile = rollerEl.children[idx];
    if (!tile) return 0;

    var r = tile.getBoundingClientRect();
    var tileCenter = r.left + r.width / 2;
    return (contCenter - tileCenter);
  }

  function buildIdleLoop(baseItems) {
    var contW = rollerWrapEl.getBoundingClientRect().width || 900;
    var approxTileW = 130;
    var minTiles = Math.max(80, Math.ceil((contW * 5) / approxTileW));
    var out = [];
    for (var i = 0; i < minTiles; i++) {
      out.push(baseItems[i % baseItems.length]);
    }
    return out;
  }

  function startIdle() {
    var base = (state.payload && state.payload.reel && state.payload.reel.length > 0)
      ? state.payload.reel
      : [];
    if (base.length === 0) return;

    state.idleList = buildIdleLoop(base);
    renderList(state.idleList);

    var mid = Math.floor(state.idleList.length / 2);
    centerIndexNow(mid);
  }

  function animateBetweenIndicesProfile(startIdx, targetIdx, totalSec, phases) {
    var startX  = centerOffsetForIndex(startIdx);
    var targetX = centerOffsetForIndex(targetIdx);

    var Dsigned = startX - targetX;
    if (Dsigned === 0) return;

    var dir = Dsigned >= 0 ? 1 : -1;
    var D   = Math.abs(Dsigned);

    var T = Math.max(0.5, Number(totalSec) || 6.5);
    var pIn  = phases && typeof phases.rampIn  === 'number' ? phases.rampIn  : 0.10;
    var pOut = phases && typeof phases.easeOut === 'number' ? phases.easeOut : 0.18;

    pIn  = Math.max(0.02, Math.min(0.40, pIn));
    pOut = Math.max(0.06, Math.min(0.60, pOut));

    var tIn  = T * pIn;
    var tOut = T * pOut;
    var tCru = Math.max(0, T - tIn - tOut);

    var denom = (0.5 * tIn * tIn) + (tIn * tCru) + (0.5 * tIn * tOut);
    if (denom < 1e-6) denom = 1e-6;
    var a_in = D / denom;
    var v    = a_in * tIn;
    var a_out = (tOut > 0) ? (v / tOut) : v;

    rollerEl.style.transition = 'none';
    rollerEl.style.transform  = 'translateX(' + startX + 'px)';
    void rollerEl.offsetHeight;

    var t0 = performance.now();

    function step(now) {
      var t = (now - t0) / 1000;
      if (t >= T) {
        rollerEl.style.transition = 'none';
        rollerEl.style.transform  = 'translateX(' + targetX + 'px)';
        return;
      }

      var s;
      if (t <= tIn) {
        s = 0.5 * a_in * t * t;
      } else if (t <= tIn + tCru) {
        var d1 = 0.5 * a_in * tIn * tIn;
        s = d1 + v * (t - tIn);
      } else {
        var tau = t - tIn - tCru;
        if (tau < 0) tau = 0; if (tau > tOut) tau = tOut;
        var d1b = 0.5 * a_in * tIn * tIn;
        var d2b = v * tCru;
        s = d1b + d2b + (v * tau - 0.5 * a_out * tau * tau);
      }

      if (s < 0) s = 0;
      if (s > D) s = D;

      var x = startX - (dir * s);
      rollerEl.style.transition = 'none';
      rollerEl.style.transform  = 'translateX(' + x + 'px)';

      requestAnimationFrame(step);
    }

    requestAnimationFrame(step);

    setTimeout(function () {
      rollerEl.style.transition = 'none';
      rollerEl.style.transform  = 'translateX(' + targetX + 'px)';
    }, T * 1000 + 30);
  }

  function renderShop(payload) {
    shopList.innerHTML = '';
    var entries = (payload && payload.entries) || [];
    for (var i = 0; i < entries.length; i++) {
      var e = entries[i];

      var row = document.createElement('div');
      row.className = 'shop-item';

      var img = document.createElement('img');
      if (e.image) {
        var hasExt = /\.\w+$/.test(e.image);
        img.src = 'nui://ox_inventory/web/images/' + (hasExt ? e.image : (e.image + '.png'));
      } else {
        img.src = 'nui://ox_inventory/web/images/' + (e.key || 'unknown') + '.png';
      }
      row.appendChild(img);

      var meta = document.createElement('div');
      var nm = document.createElement('div'); nm.className = 'name';  nm.textContent = e.label || e.key;
      var pr = document.createElement('div'); pr.className = 'price'; pr.textContent = '$' + (e.price || 0);
      meta.appendChild(nm); meta.appendChild(pr);
      row.appendChild(meta);

      var btn = document.createElement('button');
      btn.textContent = 'Buy';
      (function (caseKey) {
        btn.addEventListener('click', function () {
          fetch('https://ug_case_opening/ug_case_opening:shop_buy', {
            method: 'POST',
            body: JSON.stringify({ caseKey: caseKey })
          });
        });
      })(e.key);
      row.appendChild(btn);

      shopList.appendChild(row);
    }
  }

  function openShop(payload) {
    renderShop(payload);
    shopModal.classList.remove('hidden');
  }

  function closeShop() {
    shopModal.classList.add('hidden');
    fetch('https://ug_case_opening/ug_case_opening:close', { method: 'POST', body: JSON.stringify({}) });
  }

  function doRoll() {
    if (state.spinning) return;
    state.spinning = true;
    btnOpen.disabled = true;
    btnConfirm.disabled = true;

    var reel = (state.payload && state.payload.reel) || [];
    if (!reel || !reel.length) return;

    var win = reel[reel.length - 1];
    var baseFillers = reel.slice(0, Math.max(0, reel.length - 1));
    if (baseFillers.length === 0) baseFillers = reel.slice();

    var duration = 6.5;
    if (state.payload && typeof state.payload.rollDuration !== 'undefined') {
      var d = Number(state.payload.rollDuration);
      if (!isNaN(d) && d > 0.5) duration = d;
    }

    var contW = rollerWrapEl.getBoundingClientRect().width || 900;

    var preTiles  = Math.max(70, Math.floor((contW / 14) * (duration / 6.5)));
    var tailTiles = Math.max(12, Math.floor((contW / 90) * (duration / 6.5)));

    var spinList = [];
    for (var i = 0; i < preTiles; i++) {
      spinList.push(baseFillers[i % baseFillers.length]);
    }
    var winnerIdx = spinList.length;
    spinList.push(win);
    for (var j = 0; j < tailTiles; j++) {
      spinList.push(baseFillers[j % baseFillers.length]);
    }

    renderList(spinList);

    var offsetTiles = Math.max(10, Math.floor(preTiles * 0.85));
    var startIdx = Math.max(0, winnerIdx - offsetTiles);

    var phases = (state.payload && state.payload.spinPhases) || { rampIn: 0.10, easeOut: 0.18 };
    animateBetweenIndicesProfile(startIdx, winnerIdx, duration, phases);

    setTimeout(function () {
      var hold = 1.0;
      if (state.payload && typeof state.payload.revealHold !== 'undefined') {
        var h = Number(state.payload.revealHold);
        if (!isNaN(h) && h >= 0) hold = h;
      }
      setHidden(winnerEl, false);
      winnerEl.innerHTML = 'Won: <b>' + win.name + '</b> <span class="amount">x' + (win.amount || 1) + '</span>';
      try { rewardSfx.currentTime = 0; rewardSfx.play(); } catch (e) {}
      setTimeout(function () { btnConfirm.disabled = false; }, hold * 1000);
    }, duration * 1000);
  }

  btnOpen.addEventListener('click', doRoll);
  btnConfirm.addEventListener('click', function () {
    if (!state.payload) return;
    nui('ug_case_opening:confirm', { spinId: state.payload.spinId });
    btnConfirm.disabled = true;
    setTimeout(function () { btnClose.click(); }, 250);
  });
  btnClose.addEventListener('click', function () {
    setHidden(panelEl, true);
    nui('ug_case_opening:close', {});
    state.spinning = false;
  });

  if (shopClose) {
    shopClose.addEventListener('click', closeShop);
  }

  window.addEventListener('message', function (e) {
    var data = e.data || {};
    if (data.action === 'open') {
      state.payload = data.payload || {};
      state.colors  = state.payload.colors || {};
      titleEl.textContent = state.payload.caseLabel || 'Case';

      var caseImg = state.payload.image;
      if (caseImg) {
        var hasExt = /\.\w+$/.test(caseImg);
        iconEl.src = 'nui://ox_inventory/web/images/' + (hasExt ? caseImg : (caseImg + '.png'));
      } else {
        var first = (state.payload.reel && state.payload.reel[0]) || null;
        iconEl.src = first && first.image
          ? ('nui://ox_inventory/web/images/' + first.image)
          : ('nui://ox_inventory/web/images/' + (first && first.item ? first.item : 'unknown') + '.png');
      }

      setHidden(winnerEl, true);
      btnOpen.disabled = false;
      btnConfirm.disabled = true;
      panelEl.classList.remove('hidden');

      startIdle();
      return;
    }

    if (data.action === 'shop_open') {
      openShop(data.payload || { entries: [] });
      return;
    }

    if (data.action === 'shop_close') {
      closeShop();
      return;
    }
  });

  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
      if (shopModal && !shopModal.classList.contains('hidden')) {
        closeShop(); return;
      }
      btnClose.click();
    }
  });
})();
