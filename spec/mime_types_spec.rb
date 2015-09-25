require 'spec_helper'
require 'font_assets/mime_types'

describe FontAssets::MimeTypes do
  context 'given an empty hash' do
    let(:hash) { Hash.new }
    subject { described_class.new(hash) }

    it 'adds the known mime types' do
      FontAssets::MimeTypes::MIME_TYPES.each_pair do |ext, type|
expect(subject[ext]).to eq(type)
      end
    end
  end

  context 'given a populated hash' do
    let(:default_type) { 'default/type' }
    let(:hash) { { '.ttf' => default_type, '.svg' => 'test/type' } }
    subject { described_class.new(hash, default_type) }

    it 'retains the non-default-matching mime types' do
      expect(subject['.svg']).to eq(hash['.svg'])
    end

    it 'overrides the default-matching mime types' do
      expect(subject['.ttf']).not_to eq(hash['.ttf'])
    end
  end

  context '#[]' do
    let(:types) { described_class.new({}) }

    it 'returns the mime type of the passed extension' do
      expect(types['.woff']).to eq('application/x-font-woff')
    end

    it 'returns the default mime type for unknown extensions' do
      expect(types['.bad']).to eq('application/octet-stream')
    end
  end

  context '#font?' do
    let(:types) { described_class.new({}) }

    it 'is true for known font extensions' do
      FontAssets::MimeTypes::MIME_TYPES.keys.each do |key|
        expect(types.font?(key)).to eq(true)
      end
    end

    it 'is false for unrecognized font extensions' do
      expect(types.font?('.bad')).to eq(false)
      expect(types.font?('.html')).to eq(false)
      expect(types.font?('.json')).to eq(false)
    end

    it 'is false for missing values' do
      expect(types.font?('')).to eq(false)
      expect(types.font?(nil)).to eq(false)
    end
  end
end
