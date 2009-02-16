require 'irb/completion'

IRB.conf[:PROMPT][:INKY] = {
    :PROMPT_I => "> ",  # normal
    :PROMPT_S => ". ",  # continuing strings
    :PROMPT_C => ". ",  # continuing statements
    :RETURN =>   "= %s\n",
}

IRB.conf[:PROMPT_MODE] = :INKY

# http://blog.evanweaver.com/articles/2006/12/13/benchmark/
def benchmark(times = 1000, samples = 20)
    times *= samples
    cur = Time.now
    result = times.times { yield }
    print "#{cur = (Time.now - cur) / samples.to_f } seconds"
    puts " (#{(cur / $last_benchmark * 100).to_i - 100}% change)" rescue puts ""
    $last_benchmark = cur
    result
end
