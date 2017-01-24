module FileManipulations

  def FileManipulations.file_compare(base, comparison)
    # compare answer_file.txt with boarding_pass.txt
    base_target = open(base, 'r')
    comparison_target = open(comparison, 'r')
    result = base_target.read == comparison_target.read
    return result
  end
end
