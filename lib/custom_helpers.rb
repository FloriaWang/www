module CustomHelpers
  def last_project?(project)
    project == data.projects.last
  end

  def reversible_grid(index)
    css = "grid"
    css.concat " grid--rev" if index.even?
    css
  end

  def project_image_tag(image)
    image_tag "project/#{image}", class: 'thumbnail'
  end

  def testimonial_image_tag(avatar)
    image_tag "project/testimonial/#{avatar}", class: 'quote-avatar'
  end

  def card_image_tag(avatar)
    /(?<file_name>\A\w+).(?<file_existension>\w+\z)/ =~ avatar.to_s
    "<img class='card-avatar' srcset='images/team/#{file_name}.#{file_existension},
    images/team/#{file_name}_2x.#{file_existension} 2x'>"
  end

  def hdpi_image(options={})
    css_class = options[:class]
    /(?<file_path>.*)([.])(?<file_existension>.{3})/ =~ options[:path]

    hdpi_file = "#{file_path}_2x.#{file_existension}"
    img_tag =  "<img #{class?(css_class)} srcset='#{file_path}.#{file_existension}"

    File.exist?("./source/#{hdpi_file}") ? "#{img_tag}, #{hdpi_file} 2x'>" : "#{img_tag} srcset='#{file_path}.#{file_existension}'>"
  end

  def class?(css_class)
    "class='#{css_class}'" unless css_class.nil?
  end

  def link_to_github(nick)
    link_to "https://github.com/#{nick}" do
      %q(<i class="icon-github"></i>)
    end
  end

  def link_to_twitter(nick)
    link_to "https://twitter.com/#{nick}" do
      %q(<i class="icon-twitter"></i>)
    end
  end

  def ribbon(card)
    "ribbon" if card.player == "Łukasz Piestrzeniewicz"
  end
end
