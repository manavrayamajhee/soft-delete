require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Soft Delete Functionality' do
    let(:item) { create(:item) } 

    it 'soft deletes an item' do
      item.soft_delete
      expect(item.deleted_at).to be_present
    end

    it 'restores a soft-deleted item' do
      item.soft_delete
      item.restore
      expect(item.deleted_at).to be_nil
    end

    it 'excludes soft-deleted items from normal queries' do
      soft_deleted_item = create(:item, deleted_at: Time.current)
      expect(Item.all).not_to include(soft_deleted_item)
    end
  end
end



