Deface::Override.new(:virtual_path => "spree/shared/_taxonomies",
  :name => "change_text",
  :replace_contents => "h4.taxonomy-root",
  :text => "<%= link_to taxonomy.name, nested_taxons_path(taxonomy.name.downcase), class: 'list-group-item' %>"
  )


Deface::Override.new(:virtual_path => "spree/shared/_taxonomies",
  :name => "list_group",
  :surround => "h4.taxonomy-root",
  :text => "<div class='list_group'><%= render_original %></div>"
  )
