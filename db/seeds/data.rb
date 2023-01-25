# frozen_string_literal: true

def mode_data
  [
    {
      name: 'DM',
      description: 'Classic shooting practice mode. Instant respawn after deat',
      image: 'DM.jpg'
    },
    {
      name: 'Knife',
      description: 'Thematic maps for training the game with a knife',
      image: 'KNIFE.jpg'
    },
    {
      name: 'Arena',
      description: 'Each round you play with a new opponent. This is a classic "ladder" in which you need to get to the first place and defeat your opponents',
      image: 'ARENA.jpg'
    }
  ]
end

def maps_data
  [
    { name: 'de_dust2' },
    { name: 'de_mirage' },
    { name: 'de_inferno' },
    { name: 'de_anubis' }
  ]
end

def lessons_data
  [
    {
      title: 'PLAYING WITH SKINS AND DM LITE CATEGORY',
      content: '<p>DM LITE - A more optimized version of DM without SKINCHANGER and some other features, great for weaker PCs. The main feature of the category is that after playing it, you don&#39;t have to restart CS:GO to enter matchmaking or FACEIT. Such servers are found only in DM, HSDM, PISTOLDM, AWPDM modes.</p>\n\n<p>What to do if SKINCHANGER doesn&#39;t work? First of all, make sure that you have an active PREMIUM or PREMIUM LITE subscription, SKINCHANGER does not work without it. Go to your profile on the site: there is a tab where you can select a skin by clicking on it. If you have PREMIUM active, but this functionality does not work, press CTRL + F5 to clear the cache. When using Valve&#39;s in-game overlay, you will need to clear the cache manually. Open Steam Settings &gt; Browser &gt; Clear Browser Cache. After clearing the cache, click on the &#39;Reset Skins&#39; button in the SKINCHANGER tab</p>\n\n<h5>&nbsp;</h5>\n\n<h5>A border appears around the cell of the selected skin. If there is a stroke around the skin on the site, but it is not displayed on the server, check 2 points:</h5>\n\n<ol>\n\t<li>Your CYBERSHOKE account must match the account authorized in the Steam application on PC</li>\n\t<li>Make sure you are not playing on LITE servers.</li>\n</ol>\n\n<p><img src=\"https://cloud.cybershoke.net/img/png/support/lite.png\" /></p>\n'
    },
    {
      title: 'UNIQUE NICKNAME',
      content: '<p>The site has the ability to put a unique nickname, which will be assigned to the player on the site and servers. Nickname change is free until the first saved choice. After that, further changes will cost 50 cybercoins. PREMIUM users get the opportunity to change their nickname at no additional charge once every 3 months.</p>\n\n<p>Your nickname is publicly visible, so you should try to avoid anything that might offend other users or contain advertising.</p>\n\n<h5>Change your nickname</h5>\n\n<p>To change your nickname , go to the profile settings in the &ldquo;Unique nickname&rdquo; section, then click on &ldquo;change&rdquo;.</p>\n\n<p>Rules for choosing a nickname:</p>\n\n<ul>\n\t<li>The length of the nickname must be between 2 and 13 characters, including one required letter.</li>\n\t<li>Accented characters are not allowed.</li>\n\t<li>Spaces and symbols are not allowed.</li>\n\t<li>It is not allowed to borrow the names of famous people, administrations or organizations.</li>\n\t<li>Obscene phrases are prohibited, as well as any &ldquo;similar-sounding&rdquo; or &ldquo;similar&rdquo; words, phrases or puns that refer to words or statements prohibited by the rules.</li>\n</ul>\n\n<p>In case of violation of the rules, the project administration has the right to reset the nickname on the SteamID64 account. In case of a reset due to organizational necessity, the transaction amount will be returned to the site&#39;s balance. The support service cannot help with a nickname reset on a personal request.</p>\n'
    },
    {
      title: 'PLAYERS ARE NOT VISIBLE ON THE SERVER',
      content: '<p>Enter the command&nbsp;<span class=\"marker\">/hide</span>&nbsp;or in the server chat&nbsp;<span class=\"marker\">!hide</span>. It is worth noting that this may impair the performance of the game.</p>\n'
    }
  ]
end
