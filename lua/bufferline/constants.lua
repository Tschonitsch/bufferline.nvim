local M = {}
---------------------------------------------------------------------------//
-- Constants
---------------------------------------------------------------------------//
M.padding = " "

M.indicator = "▎"

M.sep_names = {
  thin = "thin",
  thick = "thick",
  slant = "slant",
  slope = "slope",
  padded_slant = "padded_slant",
  padded_slope = "padded_slope",
  rounded = "rounded",
}

---Styles that render a separator on both sides of every element.
---For these styles both the left and the right separator are always drawn
---and state dependent separator highlights are used.
---@type table<string, boolean>
M.two_sided_sep_styles = {
  [M.sep_names.slant] = true,
  [M.sep_names.padded_slant] = true,
  [M.sep_names.slope] = true,
  [M.sep_names.padded_slope] = true,
  [M.sep_names.rounded] = true,
}

--- NOTE: the first character is the RIGHT separator and the second one the
--- LEFT separator, this is the order in which they are consumed by the
--- renderer, see `bufferline.ui.get_separator`
---@type table<string, string[]>
M.sep_chars = {
  [M.sep_names.thin] = { "▏", "▕" },
  [M.sep_names.thick] = { "▌", "▐" },
  [M.sep_names.slant] = { "", "" },
  [M.sep_names.slope] = { "", "" },
  [M.sep_names.padded_slant] = { "" .. M.padding, "" .. M.padding },
  [M.sep_names.padded_slope] = { "" .. M.padding, "" .. M.padding },
  -- rounded corners, the left cap is rounded on its top left corner and the
  -- right cap on its top right corner so that every buffer is rendered as a
  -- rounded pill. These are the same glyphs used for the group separator.
  [M.sep_names.rounded] = { "", "" },
}

M.positions_key = "BufferlinePositions"

M.visibility = {
  SELECTED = 3,
  INACTIVE = 2,
  NONE = 1,
}

M.FOLDER_ICON = ""

M.ELLIPSIS = "…"

return M
