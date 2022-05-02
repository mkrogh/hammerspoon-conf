local gutter = 5

function transformWindow(transform)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  for k,v in pairs(transform) do
    if max[k] then
      f[k] = v(max[k], max)
    end
  end
  win:setFrame(f)
end


-- ultrawide support

if hs.window.focusedWindow():screen():frame().w >  2560 then
  hs.hotkey.bind({"cmd", "ctrl"}, "Left", function()
    transformWindow({
      w=function(x) return x/3 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
    transformWindow({
      x=function(x,screen) return x + (screen.w/3)*2 + gutter end,
      w=function(x) return x/3 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "ctrl"}, "Up", function()
    transformWindow({})
  end)

  hs.hotkey.bind({"cmd", "ctrl"}, "Down", function()
    transformWindow({
      x = function(x,screen) return x + (screen.w/3) + gutter end,
      w = function(w) return w/3 - gutter end,
    })
  end)

  hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Right", function()
    transformWindow({
    x = function(x,screen) return x + (screen.w/3)*2 + gutter end,
    w = function(w) return w/3 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
    transformWindow({
    x = function(x,screen) return x + (screen.w/3)*2 + gutter end,
    y = function(y,screen) return y + (screen.h/2) + gutter end,
    w = function(w) return w/3 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Left", function()
    transformWindow({
    w = function(w) return w/3 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
    transformWindow({
    y = function(y,screen) return y + (screen.h/2) + gutter end,
    w = function(w) return w/3 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Up", function()
    transformWindow({
    x = function(x,screen) return x + (screen.w/3) + gutter end,
    w = function(w) return w/3 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
    transformWindow({
    x = function(x,screen) return x + (screen.w/3) + gutter end,
    y = function(y,screen) return y + (screen.h/2) + gutter end,
    w = function(w) return w/3 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Down", function()
    transformWindow({
    x = function(x,screen) return x + (screen.w/3) + gutter end,
    w = function(w) return w/3 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)
else 
  hs.hotkey.bind({"cmd", "ctrl"}, "Left", function()
    transformWindow({
      w=function(x) return x/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
    transformWindow({
      x=function(x,screen) return x + (screen.w/2) + gutter end,
      w=function(x) return x/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "ctrl"}, "Up", function()
    transformWindow({})
  end)

  hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Right", function()
    transformWindow({
    x = function(x,screen) return x + (screen.w/2) + gutter end,
    w = function(w) return w/2 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
    transformWindow({
    x = function(x,screen) return x + (screen.w/2) + gutter end,
    y = function(y,screen) return y + (screen.h/2) + gutter end,
    w = function(w) return w/2 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Left", function()
    transformWindow({
    w = function(w) return w/2 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)

  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
    transformWindow({
    y = function(y,screen) return y + (screen.h/2) + gutter end,
    w = function(w) return w/2 - gutter end,
    h = function(h) return h/2 - gutter end
    })
  end)
end