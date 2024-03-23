import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [sectors, setSectors] = useState([]);
  const [name, setName] = useState('');
  const [selectedSectors, setSelectedSectors] = useState([]);
  const [agreedToTerms, setAgreedToTerms] = useState(false);

    useEffect(() => {
        fetch('http://localhost:8080/sector')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (Array.isArray(data)) {
                    setSectors(data);
                } else {
                    console.error('Data is not an array:', data);
                }
            })
            .catch(error => {
                console.error('Error fetching sectors:', error);
            });
    }, []);

  const handleSectorChange = (event) => {
    const values = Array.from(event.target.selectedOptions, option => option.value);
    setSelectedSectors(values);
  };

  const handleSubmit = (event) => {
    event.preventDefault();

    const formData = {
      name,
      selectedSectors,
      agreedToTerms
    };

    fetch('http://localhost:8080/client', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(formData),
    })
        .then(response => response.json())
        .then(data => {
          console.log('Success:', data);
        })
        .catch((error) => {
          console.error('Error:', error);
        });
  };

    const renderOptions = (sectors, parentId = null, level = 0) => {
        return sectors
            .filter(sector => sector.parentId === parentId)
            .map(sector => (
                <React.Fragment key={sector.sectorId}>
                    <option value={sector.sectorId}>
                        {`${'\u00A0'.repeat(level * 4)}${sector.name}`}
                    </option>
                    {renderOptions(sectors, sector.sectorId, level + 1)}
                </React.Fragment>
            ));
    };

  return (
      <form onSubmit={handleSubmit} className="form-container">
          <p>Please enter your name and pick the Sectors you are currently involved in.</p>
          <div className="form-group">
              <label htmlFor="name">Name:</label>
              <input
                  type="text"
                  id="name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  className="form-control"
              />
          </div>

          <div className="form-group">
              <label htmlFor="sectors">Sectors:</label>
              <select
                  multiple
                  size="5"
                  id="sectors"
                  value={selectedSectors}
                  onChange={handleSectorChange}
                  className="form-control"
              >
                  {renderOptions(sectors)}
              </select>
          </div>

          <div className="terms-group">
              <div>
                  <label htmlFor="terms" className="terms-label">Agree to terms</label>
              </div>
              <div>
                  <input
                      type="checkbox"
                      id="terms"
                      checked={agreedToTerms}
                      onChange={(e) => setAgreedToTerms(e.target.checked)}
                      className="terms-checkbox"
                  />
              </div>
          </div>

          <div className="form-group">
              <input type="submit" value="Save" className="btn btn-primary" />
          </div>
      </form>
  );
}

export default App;