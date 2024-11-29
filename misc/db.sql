/* creación del pseudo-codigo de la base */




publishers {
    publisher_id integer pk increments
    name varchar
    uri varchar
    date_extracted datetime
}



records {
    record_id varchar pk
    ocid varchar
    publisher_id integer > publishers.publisher_id
    published_date datetime
    licence varchar
    publication_policy varchar
    version float
    date_extracted datetime
}



releases {
    release_id varchar pk
    record_id varchar > records.record_id
    url varchar
    release_date datetime
    date_extracted datetime
}



compiledReleases {
    compiled_release_id varchar pk
    record_id varchar > records.record_id
    compiled_date datetime
    published_date datetime
    language varchar(7)
    initiation_type varchar
    date_extracted datetime
}



parties {
    party_id varchar pk
    name varchar
    identifier_scheme varchar
    identifier_id varchar
    address_street varchar
    adress_locality varchar
    adress_region varchar
    adress_country varchar
    contact_point_name varchar
    contact_point_email varchar
    contact_point_telephone varchar
    contact_point_fax varchar
    roles varchar
    details_level varchar
    details_entity_type varchar
    details_type varchar
    date_extracted datetime
}




awards {
    award_id varchar pk
    title varchar
    status varchar
    status_details varchar
    date_awarded datetime
    award_value_amount float
    award_value_currency varchar(7)
    date_extracted datetime
}




contracts {
    contract_id varchar pk
    award_id varchar > awards.award_id
    title varchar
    contract_number varchar
    status varchar
    status_details varchar
    date_signed datetime
    start_date datetime
    end_time datetime
    contract_value_amount float
    contract_value_currency varchar(7)
    date_extracted datetime
}



tenders {
    tender_id varchar pk
    title varchar
    status varchar
    status_details varchar
    date_published datetime
    procurement_method varchar
    procurement_method_details varchar
    main_procurement_category varchar
    submission_method varchar
    tender_period_start_date datetime
    tender_period_end_date datetime
    number_of_tenderers integer
    date_extracted datetime
}



tenderers {
    tenderer_id varchar pk
    party_id varchar > parties.party_id
    tender_id varchar > tenders.tender_id
    date_extracted datetime
}



items {
    item_id varchar pk
    tender_id varchar > tenders.tender_id
    description varchar
    quantity float
    unit_name varchar
    item_id_external varchar
    date_extracted datetime
}



documents {
    document_id varchar pk
    document_type varchar
    title varchar
    url varchar
    format varchar
    language varchar(7)
    date_published datetime
    tender_id varchar > tenders.tender_id
    contract_id varchar > contracts.contract_id
    date_extracted datetime
}









