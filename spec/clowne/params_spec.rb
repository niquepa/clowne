describe Clowne::Params do
  describe 'build proxy' do
    let(:params) do
      {
        profile: { data: { name: 'Robin' } }
      }
    end
    let(:permitted_params) { subject.permit(params) }

    subject { described_class.proxy(options) }

    context 'when options is true' do
      let(:options) { true }

      it { is_expected.to be_a(Clowne::Params::PassProxy) }

      it 'return all params' do
        expect(permitted_params).to eq(params)
      end
    end

    context 'when options is false' do
      let(:options) { false }

      it { is_expected.to be_a(Clowne::Params::NullProxy) }

      it 'return empty hash' do
        expect(permitted_params).to eq({})
      end
    end

    context 'when options is false' do
      let(:options) { nil }

      it { is_expected.to be_a(Clowne::Params::NullProxy) }

      it 'return empty hash' do
        expect(permitted_params).to eq({})
      end
    end

    context 'when options is a Proc' do
      let(:options) { proc { |p| p[:profile][:data] } }

      it { is_expected.to be_a(Clowne::Params::BlockProxy) }

      it 'return empty hash' do
        expect(permitted_params).to eq(name: 'Robin')
      end
    end

    context 'when options is a Symbol' do
      let(:options) { :profile }

      it { is_expected.to be_a(Clowne::Params::KeyProxy) }

      it 'return empty hash' do
        expect(permitted_params).to eq(data: { name: 'Robin' })
      end
    end

    context 'when options is undefined' do
      let(:options) { 1 }

      it { is_expected.to be_a(Clowne::Params::KeyProxy) }

      it 'raise exception' do
        expect { permitted_params }.to raise_error(KeyError)
      end
    end
  end
end