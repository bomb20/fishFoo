function get_lang
  set -e symbol
  for file in (find . *)
    if string match -r ".*\.hs" $file > /dev/null
      set symbol \u03BB
    else if string match -r ".*\.java" $file > /dev/null
      set symbol \u2615
    else if string match -r ".*\.fish" $file > /dev/null
      set symbol "><(((*> "
    end
  end
  echo $symbol
end
