RSpec.describe CharacterView do
  describe '#render' do
    it 'is html 5' do
      expect(subject.render.downcase).to start_with('<!doctype html>')
    end

    context 'when language is fr' do
      subject { CharacterView.new(language: 'fr') }

      it 'includes Niveau' do
        expect(subject.render).to include('Niveau')
      end

      it 'includes Classe' do
        expect(subject.render).to include('Classe')
      end
    end
  end
end
