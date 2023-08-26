aug project_enter
	au!
	au VimEnter * if empty($filetype) && !empty(findfile('gradlew')) | call SetupGradle() | endif
aug END

fu! SetupGradle()
	echom "detect a gradle project"
	setl path+=app/src/main/**
endfu
