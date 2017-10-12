module DogsHelper

  def convert_to_paws(rank)
    @text = ''
    rank.times do
      @text += ' <i class="fa fa-paw" aria-hidden="true"></i>'
    end
    sanitize(@text)
  end

  def sheds?(shedding)
    if shedding
      "Yes"
    else
      "No"
    end
  end

end


