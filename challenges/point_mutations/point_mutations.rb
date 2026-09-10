# First method solution
# def hamming_distance(strand1, strand2)
#   small_strand, big_strand = [strand1, strand2].sort_by(&:size)
#   small_strand.each_char.with_index.count do |nucleotide, index|
#     nucleotide != big_strand[index]
#   end
# end
# Refactored method solution
# def hamming_distance(strand1, strand2)
#   min_strand, max_strand = [strand1, strand2].sort_by(&:size)
#   (0...min_strand.size).count { |index| min_strand[index] != max_strand[index] }
# end
# 
# p hamming_distance('GAGCCTACTAACGGGAT', 'CATCGTAATGACGGCCT') == 7
# p hamming_distance('GAGCCTAG', 'GATCCA') == 2
# Solution using DNA class
class DNA
  def hamming_distance(other_strand)
    small_strand, max_strand = [strand, other_strand].sort_by(&:size)
    (0...small_strand.size).count do |index| 
      small_strand[index] != max_strand[index]
    end
  end

  private

  attr_accessor :strand

  alias_method :initialize, :strand=
end
