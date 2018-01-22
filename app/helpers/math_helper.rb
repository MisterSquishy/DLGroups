module MathHelper
    def self.compute_word_metric(pi)
        #do some stuff
        pi.each do |coord|
            return nil if coord["mi"].empty? || !numeric?(params[:i]["mi"])
            return nil if coord["li"].empty? || !numeric?(params[:i]["li"])
        end

        wm = Float::INFINITY
        (0..pi.length - 1).to_a.shuffle.each do |perm|
            puts perm
            perm.each do |i|
                #TODO figure out WM
            end
        end
    end
end