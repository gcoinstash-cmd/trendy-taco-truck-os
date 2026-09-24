-- TRENDY TACO TRUCK OS — Seed Data
INSERT INTO truck_locations (spot_name, address, hours, status, latitude, longitude) VALUES
('Arts District Brewery Row', '828 E 3rd St, Los Angeles, CA 90013', '5:00 PM – 1:00 AM', 'Serving Now', 34.0452, -118.2368)
ON CONFLICT DO NOTHING;

INSERT INTO taco_menu_items (name, category, description, price, spicy_level, tags, image_url) VALUES
('Birria de Res Quesatacos', 'Signature Tacos', 'Slow-braised beef brisket with melted Oaxaca cheese, cilantro, onion, and rich dipping consomme.', 7.50, 2, ARRAY['Best Seller', 'Signature'], 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?auto=format&fit=crop&q=80&w=600'),
('Al Pastor Con Piña', 'Signature Tacos', 'Vertical-spit marinated pork shoulder with charred pineapple, salsa verde, and micro radishes.', 6.50, 2, ARRAY['Traditional', 'Popular'], 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&q=80&w=600'),
('Truffle Wild Mushroom Taco', 'Plant Based', 'Seared king oyster & maitake mushrooms, truffle cashew crema, crispy leeks, blue corn tortilla.', 7.00, 1, ARRAY['Vegan', 'Chef Special'], 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?auto=format&fit=crop&q=80&w=600')
ON CONFLICT DO NOTHING;
