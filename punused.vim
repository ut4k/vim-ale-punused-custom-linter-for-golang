" punused custom linter

call ale#Set('go_punused_options', '')
call ale#Set('go_punused_lint_package', 1)
call ale#Set('go_punused_use_global', get(g:, 'ale_use_global_executables', 0))

function! ale_linters#go#punused#ParseErrors(buffer, lines) abort
	" pkg/domain/entity/notice.go:13:2 field Status is unused (EU1002)
	" pkg/domain/entity/notice.go:19:2 field Target is unused (EU1002)
	" pkg/domain/entity/notice.go:21:2 field SchoolID is unused (EU1002)
	" pkg/domain/entity/notice.go:22:2 field LockVersion is unused (EU1002)

    let l:pattern = '^\(.*\):\([0-9]\+\):\([0-9]\+\)\s*\(.*\)'
    let l:output = []
    let l:curr_file = ''
    for l:match in ale#util#GetMatches(a:lines, l:pattern)
		call add(l:output, {
		\   'filename': l:match[1],
		\   'lnum': str2nr(l:match[2]),
		\  'col': str2nr(l:match[3]),
		\   'type': 'W',
		\   'text': "Norminette : " . l:match[4],
		\})
    endfor

    return l:output
endfunction

call ale#linter#Define('go', {
\   'name': 'punused',
\   'executable': 'punused',
\   'command': '%e **/*notice*',
\   'callback': 'ale_linters#go#punused#ParseErrors',
\   'output_stream': 'both',
\   'lint_file': 1,
\})