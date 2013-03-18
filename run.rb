#!/usr/bin/ruby

def run(id)
  puts "running #{id}"
  system "
    set -e
    ghc -o problem#{id} problem#{id}.hs euler.hs
    timelimit -t 60 time -p ./problem#{id}
    rm problem#{id} *.o *.hi 2>/dev/null
  "
end

if ARGV.length == 0 || ARGV[0] == "run-latest"
  run(Integer(`ls -t problem*.hs | head -1 | sed 's/problem\\([0-9]*\\).hs/\\1/'`))
elsif ARGV[0].match(/^\d+$/)
  run(Integer(ARGV[0]))
end
