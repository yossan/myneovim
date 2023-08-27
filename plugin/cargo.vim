aug cargo_project_enter
	au!
	au VimEnter * if empty($filetype) && !empty(findfile("Cargo.toml", ".;")) | call SetupCargo() | endif
	autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
aug END

fu! SetupCargo()
	echom "detect a cargo project"
	set path+=src/**
	set tags+=./rusty-tags.vi;/

	if !exists("g:quickrun_config")
	  let g:quickrun_config={}
	endif
	let g:quickrun_config.rust = {'exec' : 'cargo run'}
endfu

