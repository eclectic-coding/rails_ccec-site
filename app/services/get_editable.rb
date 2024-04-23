# frozen_string_literal: true

class GetEditable
  def call(shortname)
    @editable = Editable.find_by(shortname: shortname)
  end
end
