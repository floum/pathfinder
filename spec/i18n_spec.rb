require 'ostruct'

RSpec.describe I18n do
  subject { OpenStruct.new(language: 'fr').extend I18n }

  it 'can translate level' do
    expect(subject.i18n :level).to eq 'niveau'
  end
  it 'can translate caste' do
    expect(subject.i18n :caste).to eq 'classe'
  end
end
