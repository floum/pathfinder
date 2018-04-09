RSpec.describe Character do
  describe '#from_yaml' do
    subject { Character.from_yaml('---') }

    it 'parses the name' do
      expect(subject.name).to be_nil
    end

    it 'parses the level' do
      expect(subject.level).to eq 1
    end

    it 'parses the racial abilities' do
      expect(subject.racial_abilities).to be_empty
    end

    it 'parses the class abilities' do
      expect(subject.class_abilities).to be_empty
    end

    it 'parses the traits' do
      expect(subject.traits).to be_empty
    end
    
    it 'parses the feats' do
      expect(subject.feats).to be_empty
    end

    it 'parses the spellbook' do
      expect(subject.spellbook).to be_empty
    end

    it 'parses the prepared spells per day' do
      expect(subject.prepared_spells_per_day).to be_empty
    end

    it 'parses the spells cast per day' do
      expect(subject.spells_cast_per_day).to be_empty
    end

    it 'parses skills' do
      expect(subject.skills).to be_empty
    end

    it 'parses quickness' do
      expect(subject.quickness).to eq 0
    end
    
    it 'parses toughness' do
      expect(subject.toughness).to eq 0
    end

    it 'parses willpower' do
      expect(subject.willpower).to eq 0
    end
    
    it 'parses class as caste' do
      expect(subject.caste).to eq 'Warrior'
    end
  end
end
