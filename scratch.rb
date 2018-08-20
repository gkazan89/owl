# # console commands

# # to return an Article by category_ID

# Article.where(category_id: 1)

# Article.where(category_id: 2)

# p "hello dr. owl"

# This is the type of stuff we need!
# IT WORKED FOR THE OTHER ARTICLE!!!!!!!!!!
# We would've been kinda screwed if it didn't....
# p hash[:response][:content][:blocks][:body][0][:bodyHtml]
# # THIS LINE RIGHT HERE IS EVERYTHING!!!


# # Get single article api from categories
# require "Unirest"

# preferences = ["technology", "weather"]
# @articles = []

# preferences.each do |preference|
#   response = Unirest.get(
#     "https://content.guardianapis.com/#{preference}?&api-key=#{ENV["API_KEY"]}")
#   link = response.body["response"]["results"][0]["apiUrl"] 

#   link += "?show-blocks=all&api-key=#{ENV["API_KEY"]}"

#   article = Unirest.get(link)

#   # p article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
#   @articles << article.body["response"]["content"]["blocks"]["body"][0]["bodyHtml"]
# end

# p @articles
# # render "index.json.jbuilder" # show all @articles

# these are the new articles
news = [
  {
    "title": "Mercedes-Benz Vito: ‘More than just a van’",
    "category": "technology",
    "author": "Martin Love",
    "body": "<p><strong>Mercedes-Benz Vito 119 Sport Crew<br></strong><strong>Price</strong> £28,485 <br><strong>Power </strong>190bhp<br><strong>Payload </strong><strong>1,250</strong><strong>kg<br></strong><strong>MPG </strong>47.1<br><strong>CO2 </strong>158g/km</p> <p>It’s 5am on a blissful Saturday morning and in the van are two Kiwis, a Welshman, a Frenchman and a Scot. There are also five bikes (partially dismantled), sleeping bags, camping chairs, a stove, a tool box, a large kit bag each, lots of food, water and sweets, and a weird vibrating rubber massage tool which the Scot swears is not a bedroom aid. As a group we are driving to Biarritz from London to spend six days cycling across the Pyrenees, ending in Girona before schlepping home. Six hours earlier all this caboodle was on the pavement and we faced the Tetris-like challenge of getting it all in. The Welshman claimed to be a “packing genius”. But the real star of the show was the <a href=\"https://www.mercedes-benz.co.uk/content/unitedkingdom/mpc/mpc_unitedkingdom_website/en/home_mpc/van/home/new_vans/showroom.html?gclid=CjwKCAjwqarbBRBtEiwArlfEIEpLN4aaoUmKX9w2e80rY14iium5-gLX4HQLMdQ12fY7368rVdTE_xoC9lUQAvD_BwE&amp;csref=web1606085001_ppc_100616&amp;s_kwcid=AL!160!3!199275367083!b!!g!!%2Bmercedes%20%2Bcommercial%20%2Bvehicle&amp;ef_id=WlyKOQAABB3nfNYx:20180808174940:s\">Mercedes-Benz Vito</a>. It wolfed the lot then hunkered down and cruised the length of France in a single day – even coping with being battered by marble-sized hailstones at one point, which made such a roar on its tin roof we thought it might look as if we’d been sprayed in a drive-by.</p>  <aside class=\"element element-pullquote element--supporting\"> <blockquote> <p>The Vito was the star of the show. It wolfed down all our kit and then cruised the length of France in a single day</p> </blockquote> </aside>  <p>Despite the fact we cycled the width of France and into Spain, passing through some of Europe’s most arresting scenery, there wasn’t a single day when we didn’t salute our support vehicle. The trip was an arduous test for us, but it was also a real work-out for the Vito. It spent 52 hours on the go and covered 2,074 miles. Its fuel consumption was 34.2mpg and average speed was 41mph. Its figures are all the more remarkable when you remember it was fully laden and much of the route was winding up mountain switchbacks with gradients of 14%.</p> <p>Vans are often overlooked as no more than capable workhorses. But a growing number of owners now see their potential as all-round, everyday vehicles which can place a wheel in both ruts of your life – work and play. They are hard enough for commerce yet soft enough for leisure. There are more high-spec models to choose from than ever, from VW’s Transporter Sportline to Ford’s Transit Custom Sportvan.</p> <p>The Vito is available in a bewildering variety of configurations. There are long and short versions. You can opt for two seats up front and a vast load area, or go for a crew van with up to nine seats – perfect for very large families or airport transfers. Either way, Mercedes wants to accentuate the contribution a Vito can make to your active life: it can be fitted with a ski and snowboard rack, a tailgate-mounted bike rack and a huge cool box.</p> <p>Inside, despite its aspirations, the Vito is still fairly unadorned. Seats are fabric. Its switchgear is the same as that used in Merc’s passenger cars, which is good, but the infotainment console is small and dated. Powering all of this is a sturdy diesel. You have a choice of a 1.6-litre four-cylinder or a juicier 2.1-litre diesel. There’s plenty of safety kit to choose from. The options list is a riot of three-letter acronyms featuring everything from ESP and ABS to ASR, EBD, BAS, LAC and EUC, among others. The Vito is quiet, comfortable and dependable. It’s a vehicle aiming to be so much more than just a van.</p> <p><em>Email Martin at <a href=\"mailto:https://twitter.com/MartinLove166\">martin.love@observer.co.uk</a> or follow him on Twitter <a href=\"https://twitter.com/MartinLove166\">@MartinLove166</a></em></p>"
  },
  {
    "title": "Letter: Jon Hiseman obituary",
    "category": "music",
    "author": "No author available",
    "body": "<p>In 1981 Barbara Thompson’s band Paraphernalia played in Ilminster, Somerset, and I went along. <a href=\"https://www.theguardian.com/music/2018/jun/18/jon-hiseman-obituary\" title=\"\">Jon Hiseman</a> was the drummer for his wife’s band and after buying a (vinyl) album after the show, I went backstage to get some signatures and meet the band. I told Jon how much I had enjoyed the music of Colosseum, and his reply was: “I was in that band for only four years and I get more comments about it than anything else I have done.”</p>"
  },
  {
    "title": "How the gap year became a 'gap month' – and the best ways to spend it",
    "category": "travel",
    "author": "Hannah Jane Parkinson",
    "body": "<p>Who remembers the viral skit <a href=\"https://www.youtube.com/watch?v=eKFjWR7X5dU\">Gap Yah</a>? Probably not Generation Z, which will be too young to remember it. Gap Yah (“I’m literally in Burma”) took aim at posh kids called Tarquin who went on “spiritual, cultural, political exchange things”. This was back (eight years ago!) when making fun of Old Etonians was as vicious as the internet got.</p> <p>But for Gen Z students, who picked up their A-level results last week, a gap year in a far-flung place may be looking like a far-flung idea. Witness the rise of the “<a href=\"https://www.telegraph.co.uk/travel/gap-year-travel/generation-z-gappers-demand-professional-experience/\">gap month</a>”, the result of an economic climate in which teens are preparing for up to £27,000 worth of student debt and, after that, <a href=\"https://www.theguardian.com/business/2017/nov/13/uk-wages-squeeze-continue-until-2022-resolution-foundation-warns\">stagnant wages</a> and soaring rental costs. These gap months are alternatively marketed as “micro gap years”, in the way that bedsits with the square footage of a porch are now “micro flats”.</p> <p>There has been a decline in year-long volunteering places, a market that grew to <a href=\"https://www.telegraph.co.uk/travel/travelnews/6065538/The-pitfalls-of-gap-volunteering.html\">attract scam companies</a> (although legitimate enterprises do still offer the chance to visit unusual places and make a difference). Instead, students are seeking out “intern and work” programmes abroad, hoping for a helpful CV addition to gain a headstart against the competition. A wifi connection is probably pretty high on the teen traveller’s checklist, too.</p> <p><a href=\"https://www.tefl.org.uk/\">Tefl</a> (Teaching English as a Foreign Language) courses in Europe are a good option, offering the chance to gain a qualification while not requiring the hassle of jabs or visas (at least, pre-Brexit). <a href=\"https://www.erasmusplus.org.uk/volunteer-abroad\">Erasmus placements</a> remain popular (again, get in before Brexit). But I wouldn’t rule out an entire jolly spent on a beach with summer-job earnings. When graduate students have taken to <a href=\"https://www.standard.co.uk/news/london/former-refugee-stands-with-a-sign-pleading-for-work-outside-canary-wharf-station-a3913566.html\">hanging about outside train stations with modern-day sandwich boards</a> to secure interviews, it may be the only chance of downtime for a while. Plus, imagine the Insta pics.</p>"
  }
]

# this is the histories index
stories = [
  {
    "article": "link1",
    "status": "read"
  },
  {
    "article": "link8",
    "status": "unread"
  },
  {
    "article": "link9",
    "status": "unread"
  },
  {
    "article": "https://content.guardianapis.com/technology/2018/aug/12/youtubers-feeling-burn-video-stars-crumbling-under-pressure-of-producing-new-content",
    "status": "unread"
  },
  {
    "article": "https://content.guardianapis.com/music/2018/aug/12/west-side-story-review-white-hot-fusion-of-pop-and-classical",
    "status": "unread"
  },
  {
    "article": "link4",
    "status": "read"
  },
  {
    "article": "link6",
    "status": "read"
  },
  {
    "article": "link8",
    "status": "read"
  },
  {
    "article": "https://content.guardianapis.com/technology/2018/aug/15/facebook-myanmar-rohingya-hate-speech-investigation",
    "status": "read"
  },
  {
    "article": "https://content.guardianapis.com/music/2018/aug/15/aretha-franklin-seriously-ill-stevie-wonder-jesse-jackson",
    "status": "read"
  },
  {
    "article": "https://content.guardianapis.com/travel/2018/aug/15/uk-best-fish-and-chips-foodie-bucket-list-lonely-planet-bay-stonehaven",
    "status": "read"
  },
  {
    "article": "https://content.guardianapis.com/travel/2018/aug/12/homage-food-and-drink-catalonia-ebro-ebre-delta-spain",
    "status": "read"
  },
  {
    "article": "https://content.guardianapis.com/technology/2018/aug/19/mercedes-benz-vito-more-than-just-a-van",
    "status": "unread"
  },
  {
    "article": "https://content.guardianapis.com/music/2018/aug/19/letter-jon-hiseman-obituary",
    "status": "unread"
  },
  {
    "article": "https://content.guardianapis.com/travel/shortcuts/2018/aug/19/how-the-gap-year-became-a-gap-month-and-the-best-ways-to-spend-it",
    "status": "unread"
  }
]

count = 0
stories.each do |story|
  if news[:article] == story[:article]
    p "there's a duplicate at position:"
    p count
  else
    p story[:article]
    count += 1
  end
end


# article = 
#   { "response": 
#     {
#       "status": "ok",
#       "userTier": "developer",
#       "total": 1,
#       "content": 
#       {
#         "id": "world/2018/jul/22/it-hits-you-very-quickly-canada-brews-first-cannabis-beer",
#         "type": "article",
#         "sectionId": "world",
#         "sectionName": "World news",
#         "webPublicationDate": "2018-07-22T11:41:55Z",
#         "webTitle": "'It hits you very quickly': Canada brews first cannabis beer",
#         "webUrl": "https://www.theguardian.com/world/2018/jul/22/it-hits-you-very-quickly-canada-brews-first-cannabis-beer",
#         "apiUrl": "https://content.guardianapis.com/world/2018/jul/22/it-hits-you-very-quickly-canada-brews-first-cannabis-beer",
#         "blocks": 
#         {
#           "main": 
#           {
#             "id": "5b547616e4b0b9a0a347ee06",
#             "bodyHtml": "<figure class=\"element element-image\" data-media-id=\"bb4510f1fcb3e5605b93db9d6a90d9c9ff78c378\"> <img src=\"https://media.guim.co.uk/bb4510f1fcb3e5605b93db9d6a90d9c9ff78c378/8_34_599_359/500.jpg\" alt=\"Province Brands\" width=\"500\" height=\"300\" class=\"gu-image\" /> <figcaption> <span class=\"element-image__caption\">The logo of Province Brands, the startup behind the new beer. </span> <span class=\"element-image__credit\">Photograph: Province Brands</span> </figcaption> </figure>",
#             "bodyTextSummary": "",
#             "attributes": {},
#             "published": true,
#             "createdDate": "2018-07-22T12:18:30Z",
#             "firstPublishedDate": "2018-07-22T11:38:58Z",
#             "publishedDate": "2018-07-22T12:19:00Z",
#             "lastModifiedDate": "2018-07-22T12:18:57Z",
#             "contributors": [],
#             "elements": 
#             [
#               {
#               "type": "image",
#               "assets": [
#                 {
#                 "type": "image",
#                 "mimeType": "image/jpeg",
#                 "file": "https://media.guim.co.uk/bb4510f1fcb3e5605b93db9d6a90d9c9ff78c378/8_34_599_359/500.jpg",
#                 "typeData": {
#                   "aspectRatio": "5:3",
#                   "width": 500,
#                   "height": 300
#                   }
#                 },
#                 {
#                   "type": "image",
#                   "mimeType": "image/jpeg",
#                   "file": "https://media.guim.co.uk/bb4510f1fcb3e5605b93db9d6a90d9c9ff78c378/8_34_599_359/140.jpg",
#                   "typeData": {
#                     "aspectRatio": "5:3",
#                     "width": 140,
#                     "height": 84
#                   }
#                 },
#                 {
#                   "type": "image",
#                   "mimeType": "image/jpeg",
#                   "file": "https://media.guim.co.uk/bb4510f1fcb3e5605b93db9d6a90d9c9ff78c378/8_34_599_359/599.jpg",
#                   "typeData": {
#                     "aspectRatio": "5:3",
#                     "width": 599,
#                     "height": 359
#                   }
#                 },
#                 {
#                   "type": "image",
#                   "mimeType": "image/jpeg",
#                   "file": "https://media.guim.co.uk/bb4510f1fcb3e5605b93db9d6a90d9c9ff78c378/8_34_599_359/master/599.jpg",
#                   "typeData": {
#                     "aspectRatio": "5:3",
#                     "width": 599,
#                     "height": 359,
#                     "isMaster": true
#                   }
#                 }
#             ],
#             "imageTypeData": {
#               "caption": "The logo of Province Brands, the startup behind the new beer. ",
#               "displayCredit": true,
#               "credit": "Photograph: Province Brands",
#               "source": "Province Brands",
#               "alt": "Province Brands",
#               "mediaId": "bb4510f1fcb3e5605b93db9d6a90d9c9ff78c378",
#               "mediaApiUri": "https://api.media.gutools.co.uk/images/bb4510f1fcb3e5605b93db9d6a90d9c9ff78c378",
#               "imageType": "Photograph"
#             }  
#           }
#         ]
#       }
#     }
#   }
# }
# }
# # get master image, looks like it's always the last element in image array
# pic = article[:response][:content][:blocks][:main][:elements][0][:assets].pop
# p pic[:file]