function get_lang
  set -e symbol
  for file in (ls)
    if string match -r ".*\.hs" $file > /dev/null
      set symbol \u03BB
    end
  end
  echo $symbol
end
