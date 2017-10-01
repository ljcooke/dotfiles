COLORS = [

  # Dark Grey
  '2D2D2D',
  '393939',
  '515151',

  # Light Grey/Tan
  '747369',
  'A09F93',
  'D3D0C8',
  'E8E6DF',
  'F2F0EC',

  # Red/Rose
  'F2777A',

  # Orange
  'F99157',

  # Yellow/Gold
  'FFCC66',

  # Green/Lime
  '99CC99',

  # Cyan/Turquoise
  '66CCCC',

  # Blue
  '6699CC',

  # Purple/Lilac
  'CC99CC',

  # Brown
  'D27B53',

]

if $PROGRAM_NAME == __FILE__
  puts <<-EOF
    <!DOCTYPE html>
    <style>
      table { margin: auto; }
      td { padding: 0.25em 1em; }
    </style>
    <table>
  EOF
  COLORS.each do |color|
    puts <<-EOF
      <tr>
        <td style="background: ##{color}">&nbsp;</td>
        <td><code>#{color}</code></td>
      </tr>
    EOF
  end
  puts '</table>'
end
