require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  test "is not valid without required attributes" do
    f = Film.create
    assert(f.valid?, "Model Validation: Allowed a new Film to be created with a missing attribute.")
    assert(f.errors[:title].any?, "Model Validation: Allowed \"Title\" to be empty")
    assert(f.errors[:rating].any?, "Model Validation: Allowed \"Rating\" to be empty")
    assert(f.errors[:url].any?, "Model Validation: Allowed \"URL\" to be empty")
    assert(f.errors[:consumed_on].any?, "Model Validation: Allowed \"Watched On\" to be empty")
    assert(f.errors[:directors].any?, "Model Validation: Allowed \"Directors\" to be empty")
    assert(f.errors[:release_year].any?, "Model Validation: Allowed \"Release Year\" to be empty")
    assert(f.errors[:running_time].any?, "Model Validation: Allowed \"Running Time\" to be empty")
  end
end
