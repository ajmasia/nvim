---@diagnostic disable: missing-fields
return {
  {
    "epwalsh/obsidian.nvim",
    enabled = true,
    config = function()
      require("obsidian").setup({
        dir = "~/obsidian/rolling-mind",
        -- use_advanced_uri = true,
        -- daily_notes = {
        --   folder = "dailies",
        --   template = "daily_tamplate.md",
        -- },
        completion = {
          nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },
        note_id_func = function(title)
          -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
          local suffix = ""
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            title = title
              :gsub("á", "a")
              :gsub("é", "e")
              :gsub("í", "i")
              :gsub("ó", "o")
              :gsub("ú", "u")
              :gsub("Á", "A")
              :gsub("É", "E")
              :gsub("Í", "I")
              :gsub("Ó", "O")
              :gsub("Ú", "U")
            suffix = title:gsub(" ", "_"):gsub("[^A-Za-z0-9_]", ""):lower()
          else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return suffix .. "_" .. tostring(os.time())
        end,
        mappings = {},
        -- templates = {
        --   subdir = "resources/native_templates",
        -- },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      if require("lazyvim.util").has("noice.nvim") then
        opts.defaults["<leader>o"] = { name = "+obsidian" }
      end
    end,
  },
}
