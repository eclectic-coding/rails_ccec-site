module RspecScreenshotHelperPatch
  def metadata
    RSpec.current_example.metadata
  end
end
