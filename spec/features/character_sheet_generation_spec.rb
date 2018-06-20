RSpec.describe 'Character Sheet Generation', type: :aruba do
  let(:source) { 'rincewind.yml' }
  let(:destination) { 'rincewind.html' }

  before(:each) { write_file source, '---\nname: Rincewind' }

  describe 'the second parameter' do
    it 'serves as output' do
      run "pathfinder character_sheet #{source} #{destination}"
      expect(last_command_started).to be_successfully_executed
      expect(destination).to be_an_existing_file
    end
  end
end
