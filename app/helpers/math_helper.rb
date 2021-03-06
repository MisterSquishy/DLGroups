module MathHelper
    def self.numeric? string #well this feels silly
        true if Float(string) rescue false
    end

    def self.compute_word_length(pi)
        m_tot = 0
        l_tot = 0
        pi.each do |pair|
            return nil if !numeric?(pair[:mi])
            return nil if !numeric?(pair[:li])
            m_tot += pair[:mi]
            l_tot += pair[:li]
        end

        return [{:sigma => [[]], :isInvalid => true, :m_tot => m_tot, :l_tot => l_tot}] if m_tot != l_tot

        length_to_sigma = {}
        true_word_length = Float::INFINITY
        d = pi.length
        (0..d - 1).to_a.permutation.each do |sigma|
            wm_sigma = -1
            (0..d - 1).each do |i|
                wm_i =      pi[sigma[0]][:mi] +
                            pi[sigma[d - 1]][:li]
                (1..i - 1).each do |j|
                    wm_i += pi[sigma[j]][:mi]
                end
                (i - 1..d - 2).each do |j|
                    wm_i += pi[sigma[j]][:li]
                end

                wm_sigma = [wm_i, wm_sigma].max
            end

            if length_to_sigma[wm_sigma].nil? then length_to_sigma[wm_sigma] = [sigma.map {|val| val + 1}]
            else length_to_sigma[wm_sigma].push(sigma.map {|val| val + 1})
            end

            true_word_length = [true_word_length, wm_sigma].min
        end

        wm = []
        length_to_sigma.sort.each do |length, sigma|
            wm.push({:sigma => sigma, :length => length, :isMin => true_word_length == length})
        end
        return wm
    end
end