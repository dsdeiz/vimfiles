if did_filetype()
  finish
endif

" Matches the format FOO-123.
if getline(1) =~ '^[A-Z]\+\-[0-9]\+:'
  setf markdown
endif
