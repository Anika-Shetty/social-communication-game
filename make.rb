require 'erb'

link_hash = {
  "images/3.1.1-(3.1.2.1,3.7+3.10.1,3.1.2.2).png" => {
    "images/3.1.2.1-(3.6+3.9.1).png" => "969,460,1215,1490",
    "images/3.7+3.10.1-(3.10.2.1,3.10.2.2).png" => "1295,460,1541,1490",
    "images/3.1.2.2-(3.8+3.11.1).png" => "1625,482,1867,1478"
  },
  "images/3.1.2.1-(3.6+3.9.1).png" => {
    "images/3.6+3.9.1-(3.9.2,3.14).1.png" => "90,89,1910,1513"
  },
  "images/3.1.2.2-(3.8+3.11.1).png" => {
    "images/3.8+3.11.1-(3.14,3.11.2.1,3.11.2.2).png" => "90,89,1910,1513"
  },
  "images/3.10.2.1.png" => {},
  "images/3.10.2.2.png" => {},
  "images/3.11.2.1-(3.8+3.11.1).png" => {
    "images/3.8+3.11.1-(3.14,3.11.2.1,3.11.2.2).png" => "90,89,1910,1513"
  },
  "images/3.11.2.2-(3.14).png" => {
    "images/3.14.png" => "90,89,1910,1513"
  },
  "images/3.14.png" => {},
  "images/3.6+3.9.1-(3.9.2,3.14).1.png" => {
    "images/3.9.2-(3.14).png" => "971,459,1391,1488",
    "images/3.14.png" => "1447,459,1867,1488"
  },
  "images/3.7+3.10.1-(3.10.2.1,3.10.2.2).png" => {
    "images/3.10.2.1.png" => "969,460,1215,1490",
    "images/3.10.2.2.png" => "1625,482,1867,1478"
  },
  "images/3.8+3.11.1-(3.14,3.11.2.1,3.11.2.2).png" => {
    "images/3.14.png" => "969,460,1215,1490",
    "images/3.11.2.1-(3.8+3.11.1).png" => "1295,460,1541,1490",
    "images/3.11.2.2-(3.14).png" => "1625,482,1867,1478"
  },
  "images/3.9.2-(3.14).png" => {
    "images/3.14.png" => "90,89,1910,1513"
  },
  "images/30.1.2.png" => {},
  "images/30.9.2.png" => {},
  "images/36.png" => {},
  "images/37.png" => {},
  "images/38.png" => {},
  "images/4.1.1-(4.1.2.1,4.7+4.10.1,4.1.2.2).png" => {
    "images/4.1.2.1-(4.6+4.9.1).png" => "969,460,1215,1490",
    "images/4.7+4.10.1-(4.10.2.1,4.22+4.26.1,4.10.2.2).png" => "1295,460,1541,1490",
    "images/4.1.2.2-(4.8+4.11.1).png" => "1625,482,1867,1478"
  },
  "images/4.1.2.1-(4.6+4.9.1).png" => {
    "images/4.6+4.9.1-(4.9.2).png" => "90,89,1910,1513"
  },
  "images/4.1.2.2-(4.8+4.11.1).png" => {
    "images/4.8+4.11.1-(4.11.2.1,4.11.2.2,4.25+4.27.1).png" => "90,89,1910,1513"
  },
  "images/4.10.2.1-(4.21).png" => {
    "images/4.21.png" => "90,89,1910,1513"
  },
  "images/4.10.2.2-(4.23).png" => {
    "images/4.23.png" => "90,89,1910,1513"
  },
  "images/4.11.2.1-(4.21).png" => {
    "images/4.21.png" => "90,89,1910,1513"
  },
  "images/4.11.2.2.png" => {},
  "images/4.21.png" => {},
  "images/4.22+4.26.1-(4.26.2).png" => {
    "images/4.26.2.png" => "90,89,1910,1513"
  },
  "images/4.23.png" => {},
  "images/4.25+4.27.1-(4.34,4.27.2.1,4.27.2.2).png" => {
    "images/4.34.png" => "969,460,1215,1490",
    "images/4.27.2.1-(4.35).png" => "1295,460,1541,1490",
    "images/4.27.2.2-(4.36).png" => "1625,482,1867,1478"
  },
  "images/4.26.2.png" => {},
  "images/4.27.2.1-(4.35).png" => {
    "images/4.35.png" => "90,89,1910,1513"
  },
  "images/4.27.2.2-(4.36).png" => {
    "images/4.36.png" => "90,89,1910,1513"
  },
  "images/4.34.png" => {},
  "images/4.35.png" => {},
  "images/4.36.png" => {},
  "images/4.6+4.9.1-(4.9.2).png" => {
    "images/4.9.2.png" => "90,89,1910,1513"
  },
  "images/4.7+4.10.1-(4.10.2.1,4.22+4.26.1,4.10.2.2).png" => {
    "images/4.10.2.1-(4.21).png" => "969,460,1215,1490",
    "images/4.22+4.26.1-(4.26.2).png" => "1295,460,1541,1490",
    "images/4.10.2.2-(4.23).png" => ""
  },
  "images/4.8+4.11.1-(4.11.2.1,4.11.2.2,4.25+4.27.1).png" => {
    "images/4.11.2.1-(4.21).png" => "969,460,1215,1490",
    "images/4.11.2.2.png" => "1295,460,1541,1490",
    "images/4.25+4.27.1-(4.34,4.27.2.1,4.27.2.2).png" => "1625,482,1867,1478"
  },
  "images/4.9.2.png" => {},
  "images/40.png" => {},
  "images/41.png" => {},
  "images/42.png" => {},
  "images/43.png" => {},
  "images/44.png" => {},
  "images/45.png" => {},
  "images/5.33+ 5.36.png" => {},
  "images/6.png" => {},
  "images/7.png" => {},
  "images/8.png" => {},
  "images/9.png" => {}
}


# name_hash = {}
# Dir["images/*.png"].each do |image_file|
#   key = if image_file.include?("-")
#     image_file.split("-").first.split("/").last
#   else
#     image_file.split("/").last.gsub(".png", "")
#   end
#   name_hash[key] = image_file
# end
#
# link_hash = {}
# name_hash.each do |key, image_file|
#   link_hash[image_file] = if image_file.include?("-")
#                             image_file.split("-").last.match(/\((.*)\)/)[1].split(",").map { |n| puts n; name_hash[n] }
#                           else
#                             []
#                           end
# end
#
# bad_links = link_hash.select { |k, links| links.select { |link| link.nil? }.size > 0 }
#
# if bad_links.size > 0
#   puts "FOUND BAD LINKS", bad_links
# end

def html_link(image_file, create_dir: false)
  file_name = image_file.split("/").last.gsub(".png", ".html")
  dir_name = "scene" + file_name.split(".").first
  Dir.mkdir(dir_name) if create_dir && !File.directory?(dir_name)
  dir_name + "/" + file_name
end

template = ERB.new <<~EOF
  <!DOCTYPE html>
  <html>
    <head>
      <script src="https://cdn.jsdelivr.net/npm/image-map@2.0.1/dist/image-map.min.js"></script>
      <script>
        ImageMap('img[usemap]', 500)
      </script>
      <style>
      </style>
    </head>

    <body>
      <div class="main" style="float:left;width=800px;"
        <div class="scene" style="float:left;width=80%;">
          <img style="float:left;width=100%;" src="../<%= image_file %>" usemap="#image_map">
          <% if image_links.size > 0 %>
            <map name="image_map">
            <% image_links.each do |image_link, coords| %>
              <area alt="" title="" href="../<%= html_link(image_link) %>" coords="<%= coords %>" shape="rect">
            <% end %>
            </map>
          <% end %>
        </div>
      </div>
    </body>
  </html>
EOF

html_hash = {}
link_hash.map do |image_file, image_links|
  html_hash[image_file] = template.result(binding)
end


html_hash.each do |image_file, html|
  file_with_path = html_link(image_file, create_dir: true)
  puts "Started writing file: #{file_with_path}"
  File.write(file_with_path, html)
  puts "Completed writing file: #{file_with_path}"
end

# h2 = link_hash.map do |k, links|
#   [k, links.map { |link| [link, ""] }.to_h ]
# end.to_h;pp h2;1
#
