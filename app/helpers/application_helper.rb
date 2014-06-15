module ApplicationHelper
  def plaintext_summary(text, length: 250)
    doc = Nokogiri::HTML::DocumentFragment.parse(text)
    truncate(doc.css('p').map(&:text).join('').to_s, :length => length)
  end
end