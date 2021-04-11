### The first data mining assignment

Below you will find a link to a data set that is going to be used in our first data mining project: https://drive.google.com/drive/folders/1vGVAcb0reBKYFfnW6OVXMf4LKtqRLYJi?usp=sharing

To download the data you need to be logged in using your Gmail account from the uw.edu.pl domain.

Records in this data set describe decks of cards used in a popular collectible card video game Clash Royale. These decks were obtained using RoyaleAPI.com service, from games which took place in January 2019. Each record consists of five values:

* a timestamp of the game (column timestamp),
* arena ID (column arena_id – higher the arena, more skilled/experienced a player is)
* outcome of a game (column has_won, 1 – the player won, 0 the player lost)
* a player ID (column tag)
* list of exactly eight cards in the player’s deck separated by “_” signs (column player_deck)

Your task is to analyze this data and search for interesting card usage patterns, and interactions/dependencies between cards. For example:

* please find card combos that were particularly popular in January 2019 (e.g., top 100 card sets with regard to their support, top 100 card sets of size 2, size 3, etc.),
* identify those card combos which have high win-rates (e.g., top 100 card sets with regard to win-rate and with support > 1%),
* does the card usage/popularity/effectiveness changes in time?
* does the arena level have any influence on card usage/popularity/effectiveness?
* find interesting associations between cards,
* can you cluster players according to their play patterns and card preferences?
Additionally, design and construct a card recommender system that allows players to indicate four cards which they want to have in a deck, and recommends the remaining four to create a reasonable deck. How can you evaluate the effectiveness of your recommendations?

Report your discoveries in the form of R notebook (with code and all computation outcomes). Please remember about visualizations – make this report as interesting for a reader as you can.
