-- TRENDY TACO TRUCK OS — Supabase Schema | Ghost Factory™
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS truck_locations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  spot_name TEXT NOT NULL,
  address TEXT NOT NULL,
  hours TEXT NOT NULL,
  status TEXT DEFAULT 'Serving Now' CHECK (status IN ('Serving Now', 'En Route', 'Prep Mode', 'Closed')),
  latitude NUMERIC(9,6) DEFAULT 34.0522,
  longitude NUMERIC(9,6) DEFAULT -118.2437,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
ALTER TABLE truck_locations ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read location" ON truck_locations FOR SELECT USING (true);
CREATE POLICY "Admin update location" ON truck_locations FOR ALL USING (auth.role() = 'authenticated');

CREATE TABLE IF NOT EXISTS taco_menu_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  category TEXT DEFAULT 'Tacos',
  description TEXT,
  price NUMERIC(6,2) NOT NULL,
  spicy_level INTEGER DEFAULT 1,
  ingredients TEXT[],
  tags TEXT[],
  image_url TEXT,
  available BOOLEAN DEFAULT true
);
ALTER TABLE taco_menu_items ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read menu" ON taco_menu_items FOR SELECT USING (available = true);
CREATE POLICY "Admin manage menu" ON taco_menu_items FOR ALL USING (auth.role() = 'authenticated');

CREATE TABLE IF NOT EXISTS catering_leads (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT,
  guest_count INTEGER NOT NULL,
  event_date DATE NOT NULL,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'contacted', 'confirmed', 'declined')),
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
ALTER TABLE catering_leads ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public insert leads" ON catering_leads FOR INSERT WITH CHECK (true);
CREATE POLICY "Admin manage leads" ON catering_leads FOR ALL USING (auth.role() = 'authenticated');
