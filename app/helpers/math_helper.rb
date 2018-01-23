module MathHelper
    def self.numeric? string #well this feels silly
        true if Float(string) rescue false
    end

    def self.compute_word_length(pi)
        pi.each do |pair|
            return nil if !numeric?(pair[:mi])
            return nil if !numeric?(pair[:li])
        end

        wm = Float::INFINITY
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
            wm = [wm_sigma, wm].min
        end
        return wm
    end
end