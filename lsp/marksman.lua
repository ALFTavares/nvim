-- Markdown: links, references, headings, completion (pacman -S marksman)
return {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "markdown.mdx" },
    root_markers = { ".marksman.toml", ".git" },
}
