def hamming_distance(strand1, strand2)
  small_strand, big_strand = [strand1, strand2].sort_by(&:size)
  small_strand.each_char.with_index.count do |nucleotide, index|
    nucleotide != big_strand[index]
  end
end

p hamming_distance('GAGCCTACTAACGGGAT', 'CATCGTAATGACGGCCT') == 7
p hamming_distance('GAGCCTAG', 'GATCCA') == 2
