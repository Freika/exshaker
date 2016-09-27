# Script for populating the database. You can run it as:
#     mix run priv/repo/seeds.exs

alias Exshaker.Repo
alias Exshaker.Game
alias Exshaker.Race

#########
# Games #
#########
wow = Repo.get_by(Game, name: "World of Warcraft") ||
  Repo.insert!(%Game{
    name: "World of Warcraft",
    content: "Наверняка многие тысячи игроков сталкивались с выбором имени игрового персонажа. Это не всегда легко - подобрать своему аватару, альтер-эго в игровом мире подходящее ему, вам и вселенной игры имя. Генератор ников отчасти решает эту проблему - с его помощью можно сгенерировать ролевой (рп) ник для WoW, причем суммарно может быть сгенерировано несколько миллионов вариантов - есть где разгуляться!\r\n\r\nГенератор разбит на расы-категории, а поскольку расы в игре World of Warcraft довольно сильно различаются, то и создаваемые имена будут выглядеть соответственно духу и атмосферности выбранной игровой расы.",
    slug: "wow",
    description: "Онлайн генератор имен и ников для World of Warcraft"
  })


#########
# Races #
#########

Repo.get_by(Race, name: "Генератор ников для Орка") ||
  Repo.insert!(%Race{
    title: "Генератор ников для Орков(РП ники, генератор roleplay ников и имен)",
    name: "Генератор ников для Орка",
    content: "Орки - пришельцы из мира Драенор, сейчас более известного как Запределье. Несмотря на изначальную приближенность к духам природы, исторически сложилось так, что орки стали известны в качестве кровожадных и неустрашимых воителей. Имя орка звучит грубо, зачастую резко и не отличается гармонией и красотой.",
    slug: "orc",
    description: "Генератор ников для Орка",
    game_id: wow.id
  })

Repo.get_by(Race, name: "Генератор ников для Ночного Эльфа") ||
  Repo.insert!(%Race{
    title: "Генератор ников для Ночных эльфов(РП ники, генератор roleplay ников и имен)",
    name: "Генератор ников для Ночного Эльфа",
    content: "Ночные эльфы - искусные друиды и священники, отличающиеся наибольшей близостью к природе, среди прочих рас. Звучание имен ночных эльфов приятно на слух - тяга этой расы к жизни и гармонии сделала их красивыми и запоминающимися. У эльфов нет бессмысленных имен - каждый звук имеет своё значение.",
    slug: "nightelf",
    description: "Генератор ников для Ночного Эльфа",
    game_id: wow.id
  })

Repo.get_by(Race, name: "Генератор ников для Гнома") ||
  Repo.insert!(%Race{
    title: "Генератор ников для гномов(РП ники, генератор roleplay ников)",
    name: "Генератор ников для Гнома",
    content: "Гномы - искусные механики и инженеры, они обожают мастерить сложные устройства, что нередко приводит к различного масштаба разрушениям. Иногда гномы связывают свою жизнь с магией, что, однако, не мешает звучать их именам так, словно вы потрясли ведро с гайками и болтами.",
    slug: "gnome",
    description: "Генератор ников для Гномов",
    game_id: wow.id
  })

#############
# Syllables #
#############
