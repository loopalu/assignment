import React, { useState, useEffect } from 'react';

function App() {
  const [sectors, setSectors] = useState([]);
  const [name, setName] = useState('');
  const [selectedSectors, setSelectedSectors] = useState([]);
  const [agreeToTerms, setAgreeToTerms] = useState(false);

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
      agreeToTerms
    };

    fetch('http://localhost:8080/user', {
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
      <form onSubmit={handleSubmit}>
        <p>Please enter your name and pick the Sectors you are currently involved in.</p>
        <label>
          Name:
          <input type="text" value={name} onChange={(e) => setName(e.target.value)} />
        </label>
        <br /><br />
        <label>
          Sectors:
          <select multiple size="5" value={selectedSectors} onChange={handleSectorChange}>
            {renderOptions(sectors)}
          </select>
        </label>
        <br /><br />
        <label>
          <input
              type="checkbox"
              checked={agreeToTerms}
              onChange={(e) => setAgreeToTerms(e.target.checked)}
          /> Agree to terms
        </label>
        <br /><br />
        <input type="submit" value="Save" />
      </form>
  );
}

export default App;