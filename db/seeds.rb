# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['normal',
'epic',
'mount',
'gnomish_nickname'].each do |n|
	NameClassification.create(classification: n)
end

['first',
'last',
'pre-title',
'pre-pre-title',
'gnomish-nickname',
'post-title'].each do |n|
	NamePosition.create(position: n)
end

['human',
'dwarf',
'elf',
'gnome',
'half-elf',
'half-orc',
'halfling',
'mount'].each do |r|
	Race.create(name: r)
end

['barbarian',
'bard',
'cleric',
'druid',
'fighter',
'monk',
'paladin',
'ranger',
'rogue',
'sorcerer',
'wizard'].each do |c| 
	CharClass.create(name: c)
end

['fine',
'diminutive',
'tiny',
'small',
'medium',
'large',
'huge',
'gargantuan',
'colossal'].each do |s|
	Size.create(name: s)
end

['natural',
'ex',
'sp',
'su'].each do |a|
	AbilityClassification.create(classification: a)
end

['aberration',
'animal',
'construct',
'dragon',
'elemental',
'fey',
'giant',
'humanoid',
'magical beast',
'monstrous humanoid',
'ooze',
'outsider',
'plant',
'undead',
'vermin'].each do |c|
	CreatureClassification.create(classification: c)
end

Alignment.create(law_axis: 'lawful', good_axis: 'good')
Alignment.create(law_axis: 'lawful', good_axis: 'neutral')
Alignment.create(law_axis: 'lawful', good_axis: 'evil')
Alignment.create(law_axis: 'neutral', good_axis: 'good')
Alignment.create(law_axis: 'true', good_axis: 'neutral')
Alignment.create(law_axis: 'neutral', good_axis: 'evil')
Alignment.create(law_axis: 'chaotic', good_axis: 'good')
Alignment.create(law_axis: 'chaotic', good_axis: 'neutral')
Alignment.create(law_axis: 'chaotic', good_axis: 'evil')

['acid',
'air',
'chaotic',
'cold',
'darkness',
'death',
'earth',
'electricity',
'evil',
'fear',
'fire',
'force',
'good',
'language-dependent',
'lawful',
'light',
'mind-affecting',
'sonic',
'water'].each do |d|
	SpellDescriptor.create(descriptor: d)
end

#create sample spell Fireball and then associate its descriptor
Spell.create(name: "fireball", level: 3, list: "wizard", priority: 1)
Spell.where(:name => "fireball").first.spell_descriptors<<(SpellDescriptor.where(:descriptor => "fire").first)


