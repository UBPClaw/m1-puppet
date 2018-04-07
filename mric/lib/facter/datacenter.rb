Facter.add(:datacenter) do
    setcode do
        network=Facter.value(:network)
        case network
            when /10\.73\.[0-9]+\.[0-9]/
            'SanJose'
            else
            'Poway'
        end
    end
end
