class ManhattanBarDirectory::CLI

  def call
    list_neighborhoods
    menu
  end

  def list_neighborhoods
    puts "Manhattan 'hoods:"
    puts <<-DOC
    1. East Village
    2. West Village
    3. Greenwich Village
    4. Soho & Nolita
    5. Lower East Side & Chinatown
    6. Tribeca
    7. Financial District
    8. Flatiron/ Nomad
    9. Gramercy/ Murray Hill
    10. Chelsea
    11. Midtown East
    12. Midtown West
    13. Upper East Side
    14. Upper West Side
    15. Harlem, East Harlem, Morningside Heights
    16. Washington Heights/ Inwood
    DOC
    puts ""
  end

  def menu
    puts "Enter the number of the neighborhood where you would like to drink."
  end

end
