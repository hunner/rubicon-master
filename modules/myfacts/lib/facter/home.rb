ENV.each do |key,value|
  Facter.add("env_#{key}") do
    setcode do
      value
    end
  end
end

Facter.add('newlines') do
  setcode { "a\nb\nc" }
end
