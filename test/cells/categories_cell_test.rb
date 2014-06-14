require 'test_helper'

class CategoriesCellTest < Cell::TestCase
  test "index" do
    invoke :index
    assert_select "p"
  end
  

end
