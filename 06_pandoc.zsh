# vim: ft=zsh

export MD_FLAVOR="markdown\
+gfm_auto_identifiers\
+citations\
+footnotes\
+emoji\
+autolink_bare_uris\
+yaml_metadata_block\
+task_lists\
+table_captions\
+pipe_tables\
+tex_math_dollars\
+raw_html\
+all_symbols_escapable\
+implicit_figures\
+superscript\
+subscript\
+link_attributes\
+definition_lists\
+fenced_code_attributes\
+example_lists\
+inline_code_attributes\
+strikeout\
+bracketed_spans\
+space_in_atx_header\
+backtick_code_blocks\
+inline_notes\
+mark\
+emoji"

export PANDOC_PARAM="-F pandoc-crossref -F mermaid-filter -M autoSectionLabels \
--citeproc \
--pdf-engine=lualatex \
--embed-resources --standalone \
--number-sections --shift-heading-level-by=-1 \
--template=rapport.tex \
--verbose"

function generate_report() {
    pandoc $(echo ${PANDOC_PARAM}) "$1" --from ${MD_FLAVOR} --to pdf -o "$2"
}
