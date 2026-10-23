---@diagnostic disable: need-check-nil
describe("Highlights -", function()
  local highlights ---@module "bufferline.highlights"
  local config ---@module "bufferline.config"

  before_each(function()
    package.loaded["bufferline.highlights"] = nil
    package.loaded["bufferline.config"] = nil

    highlights = require("bufferline.highlights")
    config = require("bufferline.config")
  end)

  it("should set highlights as default", function()
    config.setup({ options = { themable = true } })
    config.apply()
    local hl = highlights.set("BufferLineBufferSelected", { bold = true })
    assert.truthy(hl)
    assert.is_true(hl.default)
  end)

  it("should not set highlights as default if themable = false", function()
    config.setup({ options = { themable = true } })
    config.apply()
    local hl = highlights.set("BufferLineBufferSelected", { bold = true })
    assert.truthy(hl)
    assert.is_true(hl.default)
  end)

  it("should derive the separator colours for the rounded style", function()
    config.setup({ options = { separator_style = "rounded" } })
    config.apply()
    local hls = config.highlights
    -- the separator has to blend in with the element it belongs to
    assert.is_equal(hls.separator.fg, hls.background.bg)
    assert.is_equal(hls.separator_visible.fg, hls.buffer_visible.bg)
    assert.is_equal(hls.separator_selected.fg, hls.buffer_selected.bg)
    -- and be separated from the fill
    assert.is_equal(hls.separator.bg, hls.fill.bg)
    assert.is_equal(hls.separator_visible.bg, hls.fill.bg)
    assert.is_equal(hls.separator_selected.bg, hls.fill.bg)
  end)

  it("should not override explicitly defined separator highlights for the rounded style", function()
    config.setup({
      options = { separator_style = "rounded" },
      highlights = { separator = { fg = "#ff0000", bg = "#00ff00" } },
    })
    config.apply()
    local hls = config.highlights
    assert.is_equal(hls.separator.fg, "#ff0000")
    assert.is_equal(hls.separator.bg, "#00ff00")
    -- the remaining separators are still derived
    assert.is_equal(hls.separator_visible.fg, hls.buffer_visible.bg)
  end)

  it("should not derive the separator colours for other styles", function()
    config.setup({ options = { separator_style = "slant" } })
    config.apply()
    local hls = config.highlights
    assert.is_not_equal(hls.separator.fg, hls.background.bg)
    assert.is_equal(hls.separator.bg, hls.background.bg)
  end)
end)
