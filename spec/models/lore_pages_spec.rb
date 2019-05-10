require 'rails_helper'

describe LorePage, type: :model do
  let :name { 'Test' }
  let :slug { 'aaaaabbbbbcccccdddddaaaaabbbbbcccccdddddaaaaabbbbb' }
  let :body { '<h2>Hello World!</h2>' }
  let :position { 0 }
  let :attributes do
    {
      name: name,
      slug: slug,
      body: body,
      position: position
    }
  end

  subject { described_class.new(attributes) }

  it 'is valid with all input' do
    expect(subject).to be_valid
  end

  context 'no name' do
    let :name { nil }

    it 'is invalid with no name' do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:name]).to eq ["can't be blank"]
    end
  end

  context 'no body' do
    let :body { nil }

    it 'is invalid with no body' do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:body]).to eq ["can't be blank"]
    end
  end

  context 'no position' do
    let :position { nil }

    it 'is invalid with no position' do
      expect(subject).not_to be_valid
      expect(subject.errors.messages[:position]).to eq ["can't be blank"]
    end
  end

  context 'invalid slug' do

    context 'nil slug' do
      let :slug { nil }

      it 'is invalid with no slug' do
        expect(subject).not_to be_valid
        expect(subject.errors.messages[:slug]).to eq ["can't be blank", 'contains invalid characters']
      end
    end

    context 'numeric slug' do
      let :slug { '123' }

      it 'is invalid with numeric slug' do
        expect(subject).not_to be_valid
        expect(subject.errors.messages[:slug]).to eq ['contains invalid characters']
      end
    end

    context 'invalid slug' do
      it 'is invalid with invalid slug' do
        expect(described_class.new(attributes.merge({slug: 'abc '}))).not_to be_valid
        expect(described_class.new(attributes.merge({slug: '123'}))).not_to be_valid
        expect(described_class.new(attributes.merge({slug: 'abc='}))).not_to be_valid
      end
    end

    context 'long slug' do
      let :slug { 'aaaaabbbbbcccccdddddaaaaabbbbbcccccdddddaaaaabbbbbc' }

      it 'is invalid with long slug' do
        expect(subject).not_to be_valid
        expect(subject.errors.messages[:slug]).to eq ['is too long (maximum is 50 characters)']
      end
    end

    context 'taken slug' do
      let :slug { 'taken' }
      let! :lore_page { LorePage.create(attributes) }

      it 'is invalid with taken slug' do
        expect(subject).not_to be_valid
        expect(subject.errors.messages[:slug]).to eq ['has already been taken']
      end
    end
  end
end
