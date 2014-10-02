module ApplicationHelper
  def lyricize(lyrics)
    lines = h(lyrics).split("\n")
    lines.map! {|line| "\u{266B}  #{line}"}
    lines
  end
end
