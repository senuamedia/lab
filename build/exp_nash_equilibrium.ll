; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"payoff_p1"(i64 %p1, i64 %p2) nounwind {
entry:
  %local.p1 = alloca i64
  store i64 %p1, ptr %local.p1
  %local.p2 = alloca i64
  store i64 %p2, ptr %local.p2
  %t22 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.2)
  %t23 = load i64, ptr %local.p1
  %t24 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t23)
  %t25 = load i64, ptr %local.p2
  %t26 = call i64 @"sx_f64_mul"(i64 %t24, i64 %t25)
  %t27 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.3)
  %t28 = load i64, ptr %local.p1
  %t29 = call i64 @"sx_f64_mul"(i64 %t27, i64 %t28)
  %t30 = call i64 @"sx_f64_sub"(i64 %t26, i64 %t29)
  %t31 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.4)
  %t32 = load i64, ptr %local.p2
  %t33 = call i64 @"sx_f64_mul"(i64 %t31, i64 %t32)
  %t34 = call i64 @"sx_f64_sub"(i64 %t30, i64 %t33)
  %t35 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.5)
  %t36 = call i64 @"sx_f64_add"(i64 %t34, i64 %t35)
  ret i64 %t36
}

define i64 @"grad_p1"(i64 %p2) nounwind {
entry:
  %local.p2 = alloca i64
  store i64 %p2, ptr %local.p2
  %t37 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.6)
  %t38 = load i64, ptr %local.p2
  %t39 = call i64 @"sx_f64_mul"(i64 %t37, i64 %t38)
  %t40 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.7)
  %t41 = call i64 @"sx_f64_sub"(i64 %t39, i64 %t40)
  ret i64 %t41
}

define i64 @"grad_p2"(i64 %p1) nounwind {
entry:
  %local.p1 = alloca i64
  store i64 %p1, ptr %local.p1
  %t42 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.8)
  %t43 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.9)
  %t44 = load i64, ptr %local.p1
  %t45 = call i64 @"sx_f64_mul"(i64 %t43, i64 %t44)
  %t46 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.10)
  %t47 = call i64 @"sx_f64_sub"(i64 %t45, i64 %t46)
  %t48 = call i64 @"sx_f64_sub"(i64 %t42, i64 %t47)
  ret i64 %t48
}

define i64 @"interaction_score"(i64 %p1, i64 %p2) nounwind {
entry:
  %local.g1.49 = alloca i64
  %local.g2.50 = alloca i64
  %local.prod.51 = alloca i64
  %local.denom.52 = alloca i64
  %local.p1 = alloca i64
  store i64 %p1, ptr %local.p1
  %local.p2 = alloca i64
  store i64 %p2, ptr %local.p2
  %t53 = load i64, ptr %local.p2
  %t54 = call i64 @"grad_p1"(i64 %t53)
  store i64 %t54, ptr %local.g1.49
  %t55 = load i64, ptr %local.p1
  %t56 = call i64 @"grad_p2"(i64 %t55)
  store i64 %t56, ptr %local.g2.50
  %t57 = load i64, ptr %local.g1.49
  %t58 = load i64, ptr %local.g2.50
  %t59 = call i64 @"sx_f64_mul"(i64 %t57, i64 %t58)
  store i64 %t59, ptr %local.prod.51
  %t60 = load i64, ptr %local.g1.49
  %t61 = call i64 @"abs_f64"(i64 %t60)
  %t62 = load i64, ptr %local.g2.50
  %t63 = call i64 @"abs_f64"(i64 %t62)
  %t64 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t63)
  %t65 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.11)
  %t66 = call i64 @"sx_f64_add"(i64 %t64, i64 %t65)
  store i64 %t66, ptr %local.denom.52
  %t67 = load i64, ptr %local.prod.51
  %t68 = load i64, ptr %local.denom.52
  %t69 = call i64 @"sx_f64_div"(i64 %t67, i64 %t68)
  ret i64 %t69
}

define i64 @"nash_distance"(i64 %p1, i64 %p2, i64 %n1, i64 %n2) nounwind {
entry:
  %local.d1.70 = alloca i64
  %local.d2.71 = alloca i64
  %local.p1 = alloca i64
  store i64 %p1, ptr %local.p1
  %local.p2 = alloca i64
  store i64 %p2, ptr %local.p2
  %local.n1 = alloca i64
  store i64 %n1, ptr %local.n1
  %local.n2 = alloca i64
  store i64 %n2, ptr %local.n2
  %t72 = load i64, ptr %local.p1
  %t73 = load i64, ptr %local.n1
  %t74 = call i64 @"sx_f64_sub"(i64 %t72, i64 %t73)
  %t75 = load i64, ptr %local.p1
  %t76 = load i64, ptr %local.n1
  %t77 = call i64 @"sx_f64_sub"(i64 %t75, i64 %t76)
  %t78 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t77)
  store i64 %t78, ptr %local.d1.70
  %t79 = load i64, ptr %local.p2
  %t80 = load i64, ptr %local.n2
  %t81 = call i64 @"sx_f64_sub"(i64 %t79, i64 %t80)
  %t82 = load i64, ptr %local.p2
  %t83 = load i64, ptr %local.n2
  %t84 = call i64 @"sx_f64_sub"(i64 %t82, i64 %t83)
  %t85 = call i64 @"sx_f64_mul"(i64 %t81, i64 %t84)
  store i64 %t85, ptr %local.d2.71
  %t86 = load i64, ptr %local.d1.70
  %t87 = load i64, ptr %local.d2.71
  %t88 = call i64 @"sx_f64_add"(i64 %t86, i64 %t87)
  %t89 = call i64 @"sqrt_f64"(i64 %t88)
  ret i64 %t89
}

define i64 @"test_zero_sum"() nounwind {
entry:
  %local.p1.90 = alloca i64
  %local.p2.91 = alloca i64
  %local.lr.92 = alloca i64
  %local.step.93 = alloca i64
  %local.g1.94 = alloca i64
  %local.g2.95 = alloca i64
  %local.dist.96 = alloca i64
  %local.prev_dist.97 = alloca i64
  %local.ratio.98 = alloca i64
  %local.score.99 = alloca i64
  %local.nash_p1.100 = alloca i64
  %local.nash_p2.101 = alloca i64
  %local.converged.102 = alloca i64
  %local.err1.103 = alloca i64
  %local.err2.104 = alloca i64
  %t105 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.12)
  %t106 = ptrtoint ptr %t105 to i64
  %t107 = inttoptr i64 %t106 to ptr
  call void @intrinsic_println(ptr %t107)
  %t108 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.13)
  %t109 = ptrtoint ptr %t108 to i64
  %t110 = inttoptr i64 %t109 to ptr
  call void @intrinsic_println(ptr %t110)
  %t111 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.14)
  %t112 = ptrtoint ptr %t111 to i64
  %t113 = inttoptr i64 %t112 to ptr
  call void @intrinsic_println(ptr %t113)
  %t114 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.15)
  %t115 = ptrtoint ptr %t114 to i64
  %t116 = inttoptr i64 %t115 to ptr
  call void @intrinsic_println(ptr %t116)
  %t117 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.16)
  %t118 = ptrtoint ptr %t117 to i64
  %t119 = inttoptr i64 %t118 to ptr
  call void @intrinsic_println(ptr %t119)
  %t120 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.17)
  %t121 = ptrtoint ptr %t120 to i64
  %t122 = inttoptr i64 %t121 to ptr
  call void @intrinsic_println(ptr %t122)
  %t123 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.18)
  %t124 = ptrtoint ptr %t123 to i64
  %t125 = inttoptr i64 %t124 to ptr
  call void @intrinsic_println(ptr %t125)
  %t126 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.19)
  store i64 %t126, ptr %local.p1.90
  %t127 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.20)
  store i64 %t127, ptr %local.p2.91
  %t128 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.21)
  store i64 %t128, ptr %local.lr.92
  store i64 0, ptr %local.step.93
  %t129 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.22)
  store i64 %t129, ptr %local.g1.94
  %t130 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.23)
  store i64 %t130, ptr %local.g2.95
  %t131 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.24)
  store i64 %t131, ptr %local.dist.96
  %t132 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.25)
  store i64 %t132, ptr %local.prev_dist.97
  %t133 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.26)
  store i64 %t133, ptr %local.ratio.98
  %t134 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.27)
  store i64 %t134, ptr %local.score.99
  %t135 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.28)
  %t136 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.29)
  %t137 = call i64 @"sx_f64_div"(i64 %t135, i64 %t136)
  store i64 %t137, ptr %local.nash_p1.100
  %t138 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.30)
  %t139 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.31)
  %t140 = call i64 @"sx_f64_div"(i64 %t138, i64 %t139)
  store i64 %t140, ptr %local.nash_p2.101
  %t141 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.32)
  %t142 = ptrtoint ptr %t141 to i64
  %t143 = inttoptr i64 %t142 to ptr
  call void @intrinsic_println(ptr %t143)
  %t144 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.33)
  %t145 = ptrtoint ptr %t144 to i64
  %t146 = inttoptr i64 %t145 to ptr
  call void @intrinsic_println(ptr %t146)
  %t147 = load i64, ptr %local.p1.90
  %t148 = load i64, ptr %local.p2.91
  %t149 = load i64, ptr %local.nash_p1.100
  %t150 = load i64, ptr %local.nash_p2.101
  %t151 = call i64 @"nash_distance"(i64 %t147, i64 %t148, i64 %t149, i64 %t150)
  store i64 %t151, ptr %local.prev_dist.97
  br label %loop3
loop3:
  %t152 = load i64, ptr %local.step.93
  %t153 = icmp slt i64 %t152, 200
  %t154 = zext i1 %t153 to i64
  %t155 = icmp ne i64 %t154, 0
  br i1 %t155, label %body3, label %endloop3
body3:
  %t156 = load i64, ptr %local.p2.91
  %t157 = call i64 @"grad_p1"(i64 %t156)
  store i64 %t157, ptr %local.g1.94
  %t158 = load i64, ptr %local.p1.90
  %t159 = call i64 @"grad_p2"(i64 %t158)
  store i64 %t159, ptr %local.g2.95
  %t160 = load i64, ptr %local.p1.90
  %t161 = load i64, ptr %local.lr.92
  %t162 = load i64, ptr %local.g1.94
  %t163 = call i64 @"sx_f64_mul"(i64 %t161, i64 %t162)
  %t164 = call i64 @"sx_f64_add"(i64 %t160, i64 %t163)
  %t165 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.34)
  %t166 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.35)
  %t167 = call i64 @"clamp"(i64 %t164, i64 %t165, i64 %t166)
  store i64 %t167, ptr %local.p1.90
  %t168 = load i64, ptr %local.p2.91
  %t169 = load i64, ptr %local.lr.92
  %t170 = load i64, ptr %local.g2.95
  %t171 = call i64 @"sx_f64_mul"(i64 %t169, i64 %t170)
  %t172 = call i64 @"sx_f64_add"(i64 %t168, i64 %t171)
  %t173 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.36)
  %t174 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.37)
  %t175 = call i64 @"clamp"(i64 %t172, i64 %t173, i64 %t174)
  store i64 %t175, ptr %local.p2.91
  %t176 = load i64, ptr %local.p1.90
  %t177 = load i64, ptr %local.p2.91
  %t178 = load i64, ptr %local.nash_p1.100
  %t179 = load i64, ptr %local.nash_p2.101
  %t180 = call i64 @"nash_distance"(i64 %t176, i64 %t177, i64 %t178, i64 %t179)
  store i64 %t180, ptr %local.dist.96
  %t181 = load i64, ptr %local.prev_dist.97
  %t182 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.38)
  %t183 = call i64 @"sx_f64_gt"(i64 %t181, i64 %t182)
  %t184 = icmp ne i64 %t183, 0
  br i1 %t184, label %then4, label %else4
then4:
  %t185 = load i64, ptr %local.dist.96
  %t186 = load i64, ptr %local.prev_dist.97
  %t187 = call i64 @"sx_f64_div"(i64 %t185, i64 %t186)
  store i64 %t187, ptr %local.ratio.98
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t188 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.39)
  store i64 %t188, ptr %local.ratio.98
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t189 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  %t190 = load i64, ptr %local.p1.90
  %t191 = load i64, ptr %local.p2.91
  %t192 = call i64 @"interaction_score"(i64 %t190, i64 %t191)
  store i64 %t192, ptr %local.score.99
  %t193 = load i64, ptr %local.step.93
  %t194 = srem i64 %t193, 20
  %t195 = icmp eq i64 %t194, 0
  %t196 = zext i1 %t195 to i64
  %t197 = icmp ne i64 %t196, 0
  br i1 %t197, label %then5, label %else5
then5:
  %t198 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.40)
  %t199 = ptrtoint ptr %t198 to i64
  %t200 = inttoptr i64 %t199 to ptr
  call void @intrinsic_print(ptr %t200)
  %t201 = load i64, ptr %local.step.93
  call void @print_i64(i64 %t201)
  %t202 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.41)
  %t203 = ptrtoint ptr %t202 to i64
  %t204 = inttoptr i64 %t203 to ptr
  call void @intrinsic_print(ptr %t204)
  %t205 = load i64, ptr %local.p1.90
  %t206 = call i64 @"print_f64"(i64 %t205)
  %t207 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.42)
  %t208 = ptrtoint ptr %t207 to i64
  %t209 = inttoptr i64 %t208 to ptr
  call void @intrinsic_print(ptr %t209)
  %t210 = load i64, ptr %local.p2.91
  %t211 = call i64 @"print_f64"(i64 %t210)
  %t212 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.43)
  %t213 = ptrtoint ptr %t212 to i64
  %t214 = inttoptr i64 %t213 to ptr
  call void @intrinsic_print(ptr %t214)
  %t215 = load i64, ptr %local.dist.96
  %t216 = call i64 @"print_f64"(i64 %t215)
  %t217 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.44)
  %t218 = ptrtoint ptr %t217 to i64
  %t219 = inttoptr i64 %t218 to ptr
  call void @intrinsic_print(ptr %t219)
  %t220 = load i64, ptr %local.ratio.98
  %t221 = call i64 @"print_f64"(i64 %t220)
  %t222 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.45)
  %t223 = ptrtoint ptr %t222 to i64
  %t224 = inttoptr i64 %t223 to ptr
  call void @intrinsic_print(ptr %t224)
  %t225 = load i64, ptr %local.score.99
  %t226 = call i64 @"print_f64"(i64 %t225)
  %t227 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.46)
  %t228 = ptrtoint ptr %t227 to i64
  %t229 = inttoptr i64 %t228 to ptr
  call void @intrinsic_println(ptr %t229)
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t230 = phi i64 [ 0, %then5_end ], [ 0, %else5_end ]
  %t231 = load i64, ptr %local.dist.96
  store i64 %t231, ptr %local.prev_dist.97
  %t232 = load i64, ptr %local.step.93
  %t233 = add i64 %t232, 1
  store i64 %t233, ptr %local.step.93
  br label %loop3
endloop3:
  %t234 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.47)
  %t235 = ptrtoint ptr %t234 to i64
  %t236 = inttoptr i64 %t235 to ptr
  call void @intrinsic_println(ptr %t236)
  %t237 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.48)
  %t238 = ptrtoint ptr %t237 to i64
  %t239 = inttoptr i64 %t238 to ptr
  call void @intrinsic_print(ptr %t239)
  %t240 = load i64, ptr %local.p1.90
  %t241 = call i64 @"print_f64"(i64 %t240)
  %t242 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.49)
  %t243 = ptrtoint ptr %t242 to i64
  %t244 = inttoptr i64 %t243 to ptr
  call void @intrinsic_print(ptr %t244)
  %t245 = load i64, ptr %local.nash_p1.100
  %t246 = call i64 @"print_f64"(i64 %t245)
  %t247 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.50)
  %t248 = ptrtoint ptr %t247 to i64
  %t249 = inttoptr i64 %t248 to ptr
  call void @intrinsic_println(ptr %t249)
  %t250 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.51)
  %t251 = ptrtoint ptr %t250 to i64
  %t252 = inttoptr i64 %t251 to ptr
  call void @intrinsic_print(ptr %t252)
  %t253 = load i64, ptr %local.p2.91
  %t254 = call i64 @"print_f64"(i64 %t253)
  %t255 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.52)
  %t256 = ptrtoint ptr %t255 to i64
  %t257 = inttoptr i64 %t256 to ptr
  call void @intrinsic_print(ptr %t257)
  %t258 = load i64, ptr %local.nash_p2.101
  %t259 = call i64 @"print_f64"(i64 %t258)
  %t260 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.53)
  %t261 = ptrtoint ptr %t260 to i64
  %t262 = inttoptr i64 %t261 to ptr
  call void @intrinsic_println(ptr %t262)
  %t263 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.54)
  %t264 = ptrtoint ptr %t263 to i64
  %t265 = inttoptr i64 %t264 to ptr
  call void @intrinsic_print(ptr %t265)
  %t266 = load i64, ptr %local.dist.96
  %t267 = call i64 @"print_f64"(i64 %t266)
  %t268 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.55)
  %t269 = ptrtoint ptr %t268 to i64
  %t270 = inttoptr i64 %t269 to ptr
  call void @intrinsic_println(ptr %t270)
  %t271 = load i64, ptr %local.dist.96
  %t272 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.56)
  %t273 = call i64 @"sx_f64_lt"(i64 %t271, i64 %t272)
  %t274 = icmp ne i64 %t273, 0
  br i1 %t274, label %then6, label %else6
then6:
  br label %then6_end
then6_end:
  br label %endif6
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t275 = phi i64 [ 1, %then6_end ], [ 0, %else6_end ]
  store i64 %t275, ptr %local.converged.102
  %t276 = load i64, ptr %local.converged.102
  %t277 = icmp eq i64 %t276, 1
  %t278 = zext i1 %t277 to i64
  %t279 = icmp ne i64 %t278, 0
  br i1 %t279, label %then7, label %else7
then7:
  %t280 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.57)
  %t281 = ptrtoint ptr %t280 to i64
  %t282 = inttoptr i64 %t281 to ptr
  call void @intrinsic_println(ptr %t282)
  br label %then7_end
then7_end:
  br label %endif7
else7:
  %t283 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.58)
  %t284 = ptrtoint ptr %t283 to i64
  %t285 = inttoptr i64 %t284 to ptr
  call void @intrinsic_println(ptr %t285)
  %t286 = load i64, ptr %local.p1.90
  %t287 = load i64, ptr %local.nash_p1.100
  %t288 = call i64 @"sx_f64_sub"(i64 %t286, i64 %t287)
  %t289 = call i64 @"abs_f64"(i64 %t288)
  store i64 %t289, ptr %local.err1.103
  %t290 = load i64, ptr %local.p2.91
  %t291 = load i64, ptr %local.nash_p2.101
  %t292 = call i64 @"sx_f64_sub"(i64 %t290, i64 %t291)
  %t293 = call i64 @"abs_f64"(i64 %t292)
  store i64 %t293, ptr %local.err2.104
  %t294 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.59)
  %t295 = ptrtoint ptr %t294 to i64
  %t296 = inttoptr i64 %t295 to ptr
  call void @intrinsic_print(ptr %t296)
  %t297 = load i64, ptr %local.err1.103
  %t298 = call i64 @"print_f64"(i64 %t297)
  %t299 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.60)
  %t300 = ptrtoint ptr %t299 to i64
  %t301 = inttoptr i64 %t300 to ptr
  call void @intrinsic_print(ptr %t301)
  %t302 = load i64, ptr %local.err2.104
  %t303 = call i64 @"print_f64"(i64 %t302)
  %t304 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.61)
  %t305 = ptrtoint ptr %t304 to i64
  %t306 = inttoptr i64 %t305 to ptr
  call void @intrinsic_println(ptr %t306)
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t307 = phi i64 [ 0, %then7_end ], [ 0, %else7_end ]
  %t308 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.62)
  %t309 = ptrtoint ptr %t308 to i64
  %t310 = inttoptr i64 %t309 to ptr
  call void @intrinsic_println(ptr %t310)
  ret i64 0
}

define i64 @"run_zerosum_with_alpha"(i64 %alpha_12, i64 %alpha_21) nounwind {
entry:
  %local.p1.311 = alloca i64
  %local.p2.312 = alloca i64
  %local.lr.313 = alloca i64
  %local.step.314 = alloca i64
  %local.g1.315 = alloca i64
  %local.g2.316 = alloca i64
  %local.g1_proj.317 = alloca i64
  %local.g2_proj.318 = alloca i64
  %local.dot_val.319 = alloca i64
  %local.nash_p1.320 = alloca i64
  %local.nash_p2.321 = alloca i64
  %local.alpha_12 = alloca i64
  store i64 %alpha_12, ptr %local.alpha_12
  %local.alpha_21 = alloca i64
  store i64 %alpha_21, ptr %local.alpha_21
  %t322 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.63)
  store i64 %t322, ptr %local.p1.311
  %t323 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.64)
  store i64 %t323, ptr %local.p2.312
  %t324 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.65)
  store i64 %t324, ptr %local.lr.313
  store i64 0, ptr %local.step.314
  %t325 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.66)
  store i64 %t325, ptr %local.g1.315
  %t326 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.67)
  store i64 %t326, ptr %local.g2.316
  %t327 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.68)
  store i64 %t327, ptr %local.g1_proj.317
  %t328 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.69)
  store i64 %t328, ptr %local.g2_proj.318
  %t329 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.70)
  store i64 %t329, ptr %local.dot_val.319
  %t330 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.71)
  %t331 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.72)
  %t332 = call i64 @"sx_f64_div"(i64 %t330, i64 %t331)
  store i64 %t332, ptr %local.nash_p1.320
  %t333 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.73)
  %t334 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.74)
  %t335 = call i64 @"sx_f64_div"(i64 %t333, i64 %t334)
  store i64 %t335, ptr %local.nash_p2.321
  br label %loop8
loop8:
  %t336 = load i64, ptr %local.step.314
  %t337 = icmp slt i64 %t336, 100
  %t338 = zext i1 %t337 to i64
  %t339 = icmp ne i64 %t338, 0
  br i1 %t339, label %body8, label %endloop8
body8:
  %t340 = load i64, ptr %local.p2.312
  %t341 = call i64 @"grad_p1"(i64 %t340)
  store i64 %t341, ptr %local.g1.315
  %t342 = load i64, ptr %local.p1.311
  %t343 = call i64 @"grad_p2"(i64 %t342)
  store i64 %t343, ptr %local.g2.316
  %t344 = load i64, ptr %local.g1.315
  %t345 = load i64, ptr %local.g2.316
  %t346 = call i64 @"sx_f64_mul"(i64 %t344, i64 %t345)
  store i64 %t346, ptr %local.dot_val.319
  %t347 = load i64, ptr %local.dot_val.319
  %t348 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.75)
  %t349 = call i64 @"sx_f64_lt"(i64 %t347, i64 %t348)
  %t350 = icmp ne i64 %t349, 0
  br i1 %t350, label %then9, label %else9
then9:
  %t351 = load i64, ptr %local.g1.315
  %t352 = load i64, ptr %local.alpha_12
  %t353 = load i64, ptr %local.dot_val.319
  %t354 = call i64 @"sx_f64_mul"(i64 %t352, i64 %t353)
  %t355 = load i64, ptr %local.g2.316
  %t356 = call i64 @"sx_f64_mul"(i64 %t354, i64 %t355)
  %t357 = load i64, ptr %local.g2.316
  %t358 = load i64, ptr %local.g2.316
  %t359 = call i64 @"sx_f64_mul"(i64 %t357, i64 %t358)
  %t360 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.76)
  %t361 = call i64 @"sx_f64_add"(i64 %t359, i64 %t360)
  %t362 = call i64 @"sx_f64_div"(i64 %t356, i64 %t361)
  %t363 = call i64 @"sx_f64_sub"(i64 %t351, i64 %t362)
  store i64 %t363, ptr %local.g1_proj.317
  %t364 = load i64, ptr %local.g2.316
  %t365 = load i64, ptr %local.alpha_21
  %t366 = load i64, ptr %local.dot_val.319
  %t367 = call i64 @"sx_f64_mul"(i64 %t365, i64 %t366)
  %t368 = load i64, ptr %local.g1.315
  %t369 = call i64 @"sx_f64_mul"(i64 %t367, i64 %t368)
  %t370 = load i64, ptr %local.g1.315
  %t371 = load i64, ptr %local.g1.315
  %t372 = call i64 @"sx_f64_mul"(i64 %t370, i64 %t371)
  %t373 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.77)
  %t374 = call i64 @"sx_f64_add"(i64 %t372, i64 %t373)
  %t375 = call i64 @"sx_f64_div"(i64 %t369, i64 %t374)
  %t376 = call i64 @"sx_f64_sub"(i64 %t364, i64 %t375)
  store i64 %t376, ptr %local.g2_proj.318
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t377 = load i64, ptr %local.g1.315
  store i64 %t377, ptr %local.g1_proj.317
  %t378 = load i64, ptr %local.g2.316
  store i64 %t378, ptr %local.g2_proj.318
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t379 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t380 = load i64, ptr %local.p1.311
  %t381 = load i64, ptr %local.lr.313
  %t382 = load i64, ptr %local.g1_proj.317
  %t383 = call i64 @"sx_f64_mul"(i64 %t381, i64 %t382)
  %t384 = call i64 @"sx_f64_add"(i64 %t380, i64 %t383)
  %t385 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.78)
  %t386 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.79)
  %t387 = call i64 @"clamp"(i64 %t384, i64 %t385, i64 %t386)
  store i64 %t387, ptr %local.p1.311
  %t388 = load i64, ptr %local.p2.312
  %t389 = load i64, ptr %local.lr.313
  %t390 = load i64, ptr %local.g2_proj.318
  %t391 = call i64 @"sx_f64_mul"(i64 %t389, i64 %t390)
  %t392 = call i64 @"sx_f64_add"(i64 %t388, i64 %t391)
  %t393 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.80)
  %t394 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.81)
  %t395 = call i64 @"clamp"(i64 %t392, i64 %t393, i64 %t394)
  store i64 %t395, ptr %local.p2.312
  %t396 = load i64, ptr %local.step.314
  %t397 = add i64 %t396, 1
  store i64 %t397, ptr %local.step.314
  br label %loop8
endloop8:
  %t398 = load i64, ptr %local.p1.311
  %t399 = load i64, ptr %local.p2.312
  %t400 = load i64, ptr %local.nash_p1.320
  %t401 = load i64, ptr %local.nash_p2.321
  %t402 = call i64 @"nash_distance"(i64 %t398, i64 %t399, i64 %t400, i64 %t401)
  ret i64 %t402
}

define i64 @"test_zero_sum_interaction"() nounwind {
entry:
  %local.d_none.403 = alloca i64
  %local.d_low.404 = alloca i64
  %local.d_mid.405 = alloca i64
  %local.d_high.406 = alloca i64
  %local.d_full.407 = alloca i64
  %local.d_asym.408 = alloca i64
  %local.best.409 = alloca i64
  %local.best_name.410 = alloca i64
  %local.improvement.411 = alloca i64
  %t412 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.82)
  %t413 = ptrtoint ptr %t412 to i64
  %t414 = inttoptr i64 %t413 to ptr
  call void @intrinsic_println(ptr %t414)
  %t415 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.83)
  %t416 = ptrtoint ptr %t415 to i64
  %t417 = inttoptr i64 %t416 to ptr
  call void @intrinsic_println(ptr %t417)
  %t418 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.84)
  %t419 = ptrtoint ptr %t418 to i64
  %t420 = inttoptr i64 %t419 to ptr
  call void @intrinsic_println(ptr %t420)
  %t421 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.85)
  %t422 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.86)
  %t423 = call i64 @"run_zerosum_with_alpha"(i64 %t421, i64 %t422)
  store i64 %t423, ptr %local.d_none.403
  %t424 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.87)
  %t425 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.88)
  %t426 = call i64 @"run_zerosum_with_alpha"(i64 %t424, i64 %t425)
  store i64 %t426, ptr %local.d_low.404
  %t427 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.89)
  %t428 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.90)
  %t429 = call i64 @"run_zerosum_with_alpha"(i64 %t427, i64 %t428)
  store i64 %t429, ptr %local.d_mid.405
  %t430 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.91)
  %t431 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.92)
  %t432 = call i64 @"run_zerosum_with_alpha"(i64 %t430, i64 %t431)
  store i64 %t432, ptr %local.d_high.406
  %t433 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.93)
  %t434 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.94)
  %t435 = call i64 @"run_zerosum_with_alpha"(i64 %t433, i64 %t434)
  store i64 %t435, ptr %local.d_full.407
  %t436 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.95)
  %t437 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.96)
  %t438 = call i64 @"run_zerosum_with_alpha"(i64 %t436, i64 %t437)
  store i64 %t438, ptr %local.d_asym.408
  %t439 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.97)
  %t440 = ptrtoint ptr %t439 to i64
  %t441 = inttoptr i64 %t440 to ptr
  call void @intrinsic_print(ptr %t441)
  %t442 = load i64, ptr %local.d_none.403
  %t443 = call i64 @"print_f64"(i64 %t442)
  %t444 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.98)
  %t445 = ptrtoint ptr %t444 to i64
  %t446 = inttoptr i64 %t445 to ptr
  call void @intrinsic_println(ptr %t446)
  %t447 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.99)
  %t448 = ptrtoint ptr %t447 to i64
  %t449 = inttoptr i64 %t448 to ptr
  call void @intrinsic_print(ptr %t449)
  %t450 = load i64, ptr %local.d_low.404
  %t451 = call i64 @"print_f64"(i64 %t450)
  %t452 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.100)
  %t453 = ptrtoint ptr %t452 to i64
  %t454 = inttoptr i64 %t453 to ptr
  call void @intrinsic_println(ptr %t454)
  %t455 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.101)
  %t456 = ptrtoint ptr %t455 to i64
  %t457 = inttoptr i64 %t456 to ptr
  call void @intrinsic_print(ptr %t457)
  %t458 = load i64, ptr %local.d_mid.405
  %t459 = call i64 @"print_f64"(i64 %t458)
  %t460 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.102)
  %t461 = ptrtoint ptr %t460 to i64
  %t462 = inttoptr i64 %t461 to ptr
  call void @intrinsic_println(ptr %t462)
  %t463 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.103)
  %t464 = ptrtoint ptr %t463 to i64
  %t465 = inttoptr i64 %t464 to ptr
  call void @intrinsic_print(ptr %t465)
  %t466 = load i64, ptr %local.d_high.406
  %t467 = call i64 @"print_f64"(i64 %t466)
  %t468 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.104)
  %t469 = ptrtoint ptr %t468 to i64
  %t470 = inttoptr i64 %t469 to ptr
  call void @intrinsic_println(ptr %t470)
  %t471 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.105)
  %t472 = ptrtoint ptr %t471 to i64
  %t473 = inttoptr i64 %t472 to ptr
  call void @intrinsic_print(ptr %t473)
  %t474 = load i64, ptr %local.d_full.407
  %t475 = call i64 @"print_f64"(i64 %t474)
  %t476 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.106)
  %t477 = ptrtoint ptr %t476 to i64
  %t478 = inttoptr i64 %t477 to ptr
  call void @intrinsic_println(ptr %t478)
  %t479 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.107)
  %t480 = ptrtoint ptr %t479 to i64
  %t481 = inttoptr i64 %t480 to ptr
  call void @intrinsic_print(ptr %t481)
  %t482 = load i64, ptr %local.d_asym.408
  %t483 = call i64 @"print_f64"(i64 %t482)
  %t484 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.108)
  %t485 = ptrtoint ptr %t484 to i64
  %t486 = inttoptr i64 %t485 to ptr
  call void @intrinsic_println(ptr %t486)
  %t487 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.109)
  %t488 = ptrtoint ptr %t487 to i64
  %t489 = inttoptr i64 %t488 to ptr
  call void @intrinsic_println(ptr %t489)
  %t490 = load i64, ptr %local.d_none.403
  store i64 %t490, ptr %local.best.409
  store i64 0, ptr %local.best_name.410
  %t491 = load i64, ptr %local.d_low.404
  %t492 = load i64, ptr %local.best.409
  %t493 = call i64 @"sx_f64_lt"(i64 %t491, i64 %t492)
  %t494 = icmp ne i64 %t493, 0
  br i1 %t494, label %then10, label %else10
then10:
  %t495 = load i64, ptr %local.d_low.404
  store i64 %t495, ptr %local.best.409
  store i64 1, ptr %local.best_name.410
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t496 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  %t497 = load i64, ptr %local.d_mid.405
  %t498 = load i64, ptr %local.best.409
  %t499 = call i64 @"sx_f64_lt"(i64 %t497, i64 %t498)
  %t500 = icmp ne i64 %t499, 0
  br i1 %t500, label %then11, label %else11
then11:
  %t501 = load i64, ptr %local.d_mid.405
  store i64 %t501, ptr %local.best.409
  store i64 2, ptr %local.best_name.410
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t502 = phi i64 [ 0, %then11_end ], [ 0, %else11_end ]
  %t503 = load i64, ptr %local.d_high.406
  %t504 = load i64, ptr %local.best.409
  %t505 = call i64 @"sx_f64_lt"(i64 %t503, i64 %t504)
  %t506 = icmp ne i64 %t505, 0
  br i1 %t506, label %then12, label %else12
then12:
  %t507 = load i64, ptr %local.d_high.406
  store i64 %t507, ptr %local.best.409
  store i64 3, ptr %local.best_name.410
  br label %then12_end
then12_end:
  br label %endif12
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t508 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  %t509 = load i64, ptr %local.d_full.407
  %t510 = load i64, ptr %local.best.409
  %t511 = call i64 @"sx_f64_lt"(i64 %t509, i64 %t510)
  %t512 = icmp ne i64 %t511, 0
  br i1 %t512, label %then13, label %else13
then13:
  %t513 = load i64, ptr %local.d_full.407
  store i64 %t513, ptr %local.best.409
  store i64 4, ptr %local.best_name.410
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t514 = phi i64 [ 0, %then13_end ], [ 0, %else13_end ]
  %t515 = load i64, ptr %local.d_asym.408
  %t516 = load i64, ptr %local.best.409
  %t517 = call i64 @"sx_f64_lt"(i64 %t515, i64 %t516)
  %t518 = icmp ne i64 %t517, 0
  br i1 %t518, label %then14, label %else14
then14:
  %t519 = load i64, ptr %local.d_asym.408
  store i64 %t519, ptr %local.best.409
  store i64 5, ptr %local.best_name.410
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t520 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t521 = load i64, ptr %local.best_name.410
  %t522 = icmp eq i64 %t521, 0
  %t523 = zext i1 %t522 to i64
  %t524 = icmp ne i64 %t523, 0
  br i1 %t524, label %then15, label %else15
then15:
  %t525 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.110)
  %t526 = ptrtoint ptr %t525 to i64
  %t527 = inttoptr i64 %t526 to ptr
  call void @intrinsic_println(ptr %t527)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t528 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t529 = load i64, ptr %local.best_name.410
  %t530 = icmp eq i64 %t529, 1
  %t531 = zext i1 %t530 to i64
  %t532 = icmp ne i64 %t531, 0
  br i1 %t532, label %then16, label %else16
then16:
  %t533 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.111)
  %t534 = ptrtoint ptr %t533 to i64
  %t535 = inttoptr i64 %t534 to ptr
  call void @intrinsic_println(ptr %t535)
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t536 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t537 = load i64, ptr %local.best_name.410
  %t538 = icmp eq i64 %t537, 2
  %t539 = zext i1 %t538 to i64
  %t540 = icmp ne i64 %t539, 0
  br i1 %t540, label %then17, label %else17
then17:
  %t541 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.112)
  %t542 = ptrtoint ptr %t541 to i64
  %t543 = inttoptr i64 %t542 to ptr
  call void @intrinsic_println(ptr %t543)
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t544 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t545 = load i64, ptr %local.best_name.410
  %t546 = icmp eq i64 %t545, 3
  %t547 = zext i1 %t546 to i64
  %t548 = icmp ne i64 %t547, 0
  br i1 %t548, label %then18, label %else18
then18:
  %t549 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.113)
  %t550 = ptrtoint ptr %t549 to i64
  %t551 = inttoptr i64 %t550 to ptr
  call void @intrinsic_println(ptr %t551)
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t552 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  %t553 = load i64, ptr %local.best_name.410
  %t554 = icmp eq i64 %t553, 4
  %t555 = zext i1 %t554 to i64
  %t556 = icmp ne i64 %t555, 0
  br i1 %t556, label %then19, label %else19
then19:
  %t557 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.114)
  %t558 = ptrtoint ptr %t557 to i64
  %t559 = inttoptr i64 %t558 to ptr
  call void @intrinsic_println(ptr %t559)
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t560 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  %t561 = load i64, ptr %local.best_name.410
  %t562 = icmp eq i64 %t561, 5
  %t563 = zext i1 %t562 to i64
  %t564 = icmp ne i64 %t563, 0
  br i1 %t564, label %then20, label %else20
then20:
  %t565 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.115)
  %t566 = ptrtoint ptr %t565 to i64
  %t567 = inttoptr i64 %t566 to ptr
  call void @intrinsic_println(ptr %t567)
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t568 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  %t569 = load i64, ptr %local.d_none.403
  %t570 = load i64, ptr %local.best.409
  %t571 = call i64 @"sx_f64_sub"(i64 %t569, i64 %t570)
  %t572 = load i64, ptr %local.d_none.403
  %t573 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.116)
  %t574 = call i64 @"sx_f64_add"(i64 %t572, i64 %t573)
  %t575 = call i64 @"sx_f64_div"(i64 %t571, i64 %t574)
  store i64 %t575, ptr %local.improvement.411
  %t576 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.117)
  %t577 = ptrtoint ptr %t576 to i64
  %t578 = inttoptr i64 %t577 to ptr
  call void @intrinsic_print(ptr %t578)
  %t579 = load i64, ptr %local.improvement.411
  %t580 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.118)
  %t581 = call i64 @"sx_f64_mul"(i64 %t579, i64 %t580)
  %t582 = call i64 @"print_f64"(i64 %t581)
  %t583 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.119)
  %t584 = ptrtoint ptr %t583 to i64
  %t585 = inttoptr i64 %t584 to ptr
  call void @intrinsic_println(ptr %t585)
  %t586 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.120)
  %t587 = ptrtoint ptr %t586 to i64
  %t588 = inttoptr i64 %t587 to ptr
  call void @intrinsic_println(ptr %t588)
  ret i64 0
}

define i64 @"coord_mean"(i64 %x0, i64 %x1, i64 %x2) nounwind {
entry:
  %local.x0 = alloca i64
  store i64 %x0, ptr %local.x0
  %local.x1 = alloca i64
  store i64 %x1, ptr %local.x1
  %local.x2 = alloca i64
  store i64 %x2, ptr %local.x2
  %t589 = load i64, ptr %local.x0
  %t590 = load i64, ptr %local.x1
  %t591 = call i64 @"sx_f64_add"(i64 %t589, i64 %t590)
  %t592 = load i64, ptr %local.x2
  %t593 = call i64 @"sx_f64_add"(i64 %t591, i64 %t592)
  %t594 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.121)
  %t595 = call i64 @"sx_f64_div"(i64 %t593, i64 %t594)
  ret i64 %t595
}

define i64 @"coord_grad"(i64 %xi, i64 %target, i64 %m, i64 %c) nounwind {
entry:
  %local.g_self.596 = alloca i64
  %local.g_coord.597 = alloca i64
  %local.xi = alloca i64
  store i64 %xi, ptr %local.xi
  %local.target = alloca i64
  store i64 %target, ptr %local.target
  %local.m = alloca i64
  store i64 %m, ptr %local.m
  %local.c = alloca i64
  store i64 %c, ptr %local.c
  %t598 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.122)
  %t599 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.123)
  %t600 = load i64, ptr %local.xi
  %t601 = load i64, ptr %local.target
  %t602 = call i64 @"sx_f64_sub"(i64 %t600, i64 %t601)
  %t603 = call i64 @"sx_f64_mul"(i64 %t599, i64 %t602)
  %t604 = call i64 @"sx_f64_sub"(i64 %t598, i64 %t603)
  store i64 %t604, ptr %local.g_self.596
  %t605 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.124)
  %t606 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.125)
  %t607 = load i64, ptr %local.c
  %t608 = call i64 @"sx_f64_mul"(i64 %t606, i64 %t607)
  %t609 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.126)
  %t610 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.127)
  %t611 = call i64 @"sx_f64_div"(i64 %t609, i64 %t610)
  %t612 = call i64 @"sx_f64_mul"(i64 %t608, i64 %t611)
  %t613 = load i64, ptr %local.xi
  %t614 = load i64, ptr %local.m
  %t615 = call i64 @"sx_f64_sub"(i64 %t613, i64 %t614)
  %t616 = call i64 @"sx_f64_mul"(i64 %t612, i64 %t615)
  %t617 = call i64 @"sx_f64_sub"(i64 %t605, i64 %t616)
  store i64 %t617, ptr %local.g_coord.597
  %t618 = load i64, ptr %local.g_self.596
  %t619 = load i64, ptr %local.g_coord.597
  %t620 = call i64 @"sx_f64_add"(i64 %t618, i64 %t619)
  ret i64 %t620
}

define i64 @"run_coordination"(i64 %c) nounwind {
entry:
  %local.x0.621 = alloca i64
  %local.x1.622 = alloca i64
  %local.x2.623 = alloca i64
  %local.lr.624 = alloca i64
  %local.step.625 = alloca i64
  %local.m.626 = alloca i64
  %local.g0.627 = alloca i64
  %local.g1.628 = alloca i64
  %local.g2.629 = alloca i64
  %local.t0.630 = alloca i64
  %local.t1.631 = alloca i64
  %local.t2.632 = alloca i64
  %local.s.633 = alloca i64
  %local.c = alloca i64
  store i64 %c, ptr %local.c
  %t634 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.128)
  store i64 %t634, ptr %local.x0.621
  %t635 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.129)
  store i64 %t635, ptr %local.x1.622
  %t636 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.130)
  store i64 %t636, ptr %local.x2.623
  %t637 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.131)
  store i64 %t637, ptr %local.lr.624
  store i64 0, ptr %local.step.625
  %t638 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.132)
  store i64 %t638, ptr %local.m.626
  %t639 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.133)
  store i64 %t639, ptr %local.g0.627
  %t640 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.134)
  store i64 %t640, ptr %local.g1.628
  %t641 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.135)
  store i64 %t641, ptr %local.g2.629
  %t642 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.136)
  store i64 %t642, ptr %local.t0.630
  %t643 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.137)
  store i64 %t643, ptr %local.t1.631
  %t644 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.138)
  store i64 %t644, ptr %local.t2.632
  br label %loop21
loop21:
  %t645 = load i64, ptr %local.step.625
  %t646 = icmp slt i64 %t645, 300
  %t647 = zext i1 %t646 to i64
  %t648 = icmp ne i64 %t647, 0
  br i1 %t648, label %body21, label %endloop21
body21:
  %t649 = load i64, ptr %local.x0.621
  %t650 = load i64, ptr %local.x1.622
  %t651 = load i64, ptr %local.x2.623
  %t652 = call i64 @"coord_mean"(i64 %t649, i64 %t650, i64 %t651)
  store i64 %t652, ptr %local.m.626
  %t653 = load i64, ptr %local.x0.621
  %t654 = load i64, ptr %local.t0.630
  %t655 = load i64, ptr %local.m.626
  %t656 = load i64, ptr %local.c
  %t657 = call i64 @"coord_grad"(i64 %t653, i64 %t654, i64 %t655, i64 %t656)
  store i64 %t657, ptr %local.g0.627
  %t658 = load i64, ptr %local.x1.622
  %t659 = load i64, ptr %local.t1.631
  %t660 = load i64, ptr %local.m.626
  %t661 = load i64, ptr %local.c
  %t662 = call i64 @"coord_grad"(i64 %t658, i64 %t659, i64 %t660, i64 %t661)
  store i64 %t662, ptr %local.g1.628
  %t663 = load i64, ptr %local.x2.623
  %t664 = load i64, ptr %local.t2.632
  %t665 = load i64, ptr %local.m.626
  %t666 = load i64, ptr %local.c
  %t667 = call i64 @"coord_grad"(i64 %t663, i64 %t664, i64 %t665, i64 %t666)
  store i64 %t667, ptr %local.g2.629
  %t668 = load i64, ptr %local.x0.621
  %t669 = load i64, ptr %local.lr.624
  %t670 = load i64, ptr %local.g0.627
  %t671 = call i64 @"sx_f64_mul"(i64 %t669, i64 %t670)
  %t672 = call i64 @"sx_f64_add"(i64 %t668, i64 %t671)
  %t673 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.139)
  %t674 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.140)
  %t675 = call i64 @"clamp"(i64 %t672, i64 %t673, i64 %t674)
  store i64 %t675, ptr %local.x0.621
  %t676 = load i64, ptr %local.x1.622
  %t677 = load i64, ptr %local.lr.624
  %t678 = load i64, ptr %local.g1.628
  %t679 = call i64 @"sx_f64_mul"(i64 %t677, i64 %t678)
  %t680 = call i64 @"sx_f64_add"(i64 %t676, i64 %t679)
  %t681 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.141)
  %t682 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.142)
  %t683 = call i64 @"clamp"(i64 %t680, i64 %t681, i64 %t682)
  store i64 %t683, ptr %local.x1.622
  %t684 = load i64, ptr %local.x2.623
  %t685 = load i64, ptr %local.lr.624
  %t686 = load i64, ptr %local.g2.629
  %t687 = call i64 @"sx_f64_mul"(i64 %t685, i64 %t686)
  %t688 = call i64 @"sx_f64_add"(i64 %t684, i64 %t687)
  %t689 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.143)
  %t690 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.144)
  %t691 = call i64 @"clamp"(i64 %t688, i64 %t689, i64 %t690)
  store i64 %t691, ptr %local.x2.623
  %t692 = load i64, ptr %local.step.625
  %t693 = add i64 %t692, 1
  store i64 %t693, ptr %local.step.625
  br label %loop21
endloop21:
  %t694 = load i64, ptr %local.x0.621
  %t695 = load i64, ptr %local.x1.622
  %t696 = load i64, ptr %local.x2.623
  %t697 = call i64 @"coord_mean"(i64 %t694, i64 %t695, i64 %t696)
  store i64 %t697, ptr %local.m.626
  %t698 = load i64, ptr %local.x0.621
  %t699 = load i64, ptr %local.m.626
  %t700 = call i64 @"sx_f64_sub"(i64 %t698, i64 %t699)
  %t701 = load i64, ptr %local.x0.621
  %t702 = load i64, ptr %local.m.626
  %t703 = call i64 @"sx_f64_sub"(i64 %t701, i64 %t702)
  %t704 = call i64 @"sx_f64_mul"(i64 %t700, i64 %t703)
  %t705 = load i64, ptr %local.x1.622
  %t706 = load i64, ptr %local.m.626
  %t707 = call i64 @"sx_f64_sub"(i64 %t705, i64 %t706)
  %t708 = load i64, ptr %local.x1.622
  %t709 = load i64, ptr %local.m.626
  %t710 = call i64 @"sx_f64_sub"(i64 %t708, i64 %t709)
  %t711 = call i64 @"sx_f64_mul"(i64 %t707, i64 %t710)
  %t712 = call i64 @"sx_f64_add"(i64 %t704, i64 %t711)
  %t713 = load i64, ptr %local.x2.623
  %t714 = load i64, ptr %local.m.626
  %t715 = call i64 @"sx_f64_sub"(i64 %t713, i64 %t714)
  %t716 = load i64, ptr %local.x2.623
  %t717 = load i64, ptr %local.m.626
  %t718 = call i64 @"sx_f64_sub"(i64 %t716, i64 %t717)
  %t719 = call i64 @"sx_f64_mul"(i64 %t715, i64 %t718)
  %t720 = call i64 @"sx_f64_add"(i64 %t712, i64 %t719)
  store i64 %t720, ptr %local.s.633
  %t721 = load i64, ptr %local.s.633
  %t722 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.145)
  %t723 = call i64 @"sx_f64_div"(i64 %t721, i64 %t722)
  %t724 = call i64 @"sqrt_f64"(i64 %t723)
  ret i64 %t724
}

define i64 @"test_coordination"() nounwind {
entry:
  %local.x0.725 = alloca i64
  %local.x1.726 = alloca i64
  %local.x2.727 = alloca i64
  %local.lr.728 = alloca i64
  %local.step.729 = alloca i64
  %local.m.730 = alloca i64
  %local.g0.731 = alloca i64
  %local.g1.732 = alloca i64
  %local.g2.733 = alloca i64
  %local.dist.734 = alloca i64
  %local.t0.735 = alloca i64
  %local.t1.736 = alloca i64
  %local.t2.737 = alloca i64
  %local.c_val.738 = alloca i64
  %local.sp0.739 = alloca i64
  %local.sp1.740 = alloca i64
  %local.sp2.741 = alloca i64
  %local.sp3.742 = alloca i64
  %local.sp4.743 = alloca i64
  %local.sp5.744 = alloca i64
  %local.sp6.745 = alloca i64
  %local.ratio.746 = alloca i64
  %t747 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.146)
  %t748 = ptrtoint ptr %t747 to i64
  %t749 = inttoptr i64 %t748 to ptr
  call void @intrinsic_println(ptr %t749)
  %t750 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.147)
  %t751 = ptrtoint ptr %t750 to i64
  %t752 = inttoptr i64 %t751 to ptr
  call void @intrinsic_println(ptr %t752)
  %t753 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.148)
  %t754 = ptrtoint ptr %t753 to i64
  %t755 = inttoptr i64 %t754 to ptr
  call void @intrinsic_println(ptr %t755)
  %t756 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.149)
  %t757 = ptrtoint ptr %t756 to i64
  %t758 = inttoptr i64 %t757 to ptr
  call void @intrinsic_println(ptr %t758)
  %t759 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.150)
  %t760 = ptrtoint ptr %t759 to i64
  %t761 = inttoptr i64 %t760 to ptr
  call void @intrinsic_println(ptr %t761)
  %t762 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.151)
  %t763 = ptrtoint ptr %t762 to i64
  %t764 = inttoptr i64 %t763 to ptr
  call void @intrinsic_println(ptr %t764)
  %t765 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.152)
  store i64 %t765, ptr %local.x0.725
  %t766 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.153)
  store i64 %t766, ptr %local.x1.726
  %t767 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.154)
  store i64 %t767, ptr %local.x2.727
  %t768 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.155)
  store i64 %t768, ptr %local.lr.728
  store i64 0, ptr %local.step.729
  %t769 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.156)
  store i64 %t769, ptr %local.m.730
  %t770 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.157)
  store i64 %t770, ptr %local.g0.731
  %t771 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.158)
  store i64 %t771, ptr %local.g1.732
  %t772 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.159)
  store i64 %t772, ptr %local.g2.733
  %t773 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.160)
  store i64 %t773, ptr %local.dist.734
  %t774 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.161)
  store i64 %t774, ptr %local.t0.735
  %t775 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.162)
  store i64 %t775, ptr %local.t1.736
  %t776 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.163)
  store i64 %t776, ptr %local.t2.737
  %t777 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.164)
  store i64 %t777, ptr %local.c_val.738
  %t778 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.165)
  %t779 = ptrtoint ptr %t778 to i64
  %t780 = inttoptr i64 %t779 to ptr
  call void @intrinsic_println(ptr %t780)
  %t781 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.166)
  %t782 = ptrtoint ptr %t781 to i64
  %t783 = inttoptr i64 %t782 to ptr
  call void @intrinsic_println(ptr %t783)
  %t784 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.167)
  %t785 = ptrtoint ptr %t784 to i64
  %t786 = inttoptr i64 %t785 to ptr
  call void @intrinsic_println(ptr %t786)
  br label %loop22
loop22:
  %t787 = load i64, ptr %local.step.729
  %t788 = icmp slt i64 %t787, 200
  %t789 = zext i1 %t788 to i64
  %t790 = icmp ne i64 %t789, 0
  br i1 %t790, label %body22, label %endloop22
body22:
  %t791 = load i64, ptr %local.x0.725
  %t792 = load i64, ptr %local.x1.726
  %t793 = load i64, ptr %local.x2.727
  %t794 = call i64 @"coord_mean"(i64 %t791, i64 %t792, i64 %t793)
  store i64 %t794, ptr %local.m.730
  %t795 = load i64, ptr %local.x0.725
  %t796 = load i64, ptr %local.t0.735
  %t797 = load i64, ptr %local.m.730
  %t798 = load i64, ptr %local.c_val.738
  %t799 = call i64 @"coord_grad"(i64 %t795, i64 %t796, i64 %t797, i64 %t798)
  store i64 %t799, ptr %local.g0.731
  %t800 = load i64, ptr %local.x1.726
  %t801 = load i64, ptr %local.t1.736
  %t802 = load i64, ptr %local.m.730
  %t803 = load i64, ptr %local.c_val.738
  %t804 = call i64 @"coord_grad"(i64 %t800, i64 %t801, i64 %t802, i64 %t803)
  store i64 %t804, ptr %local.g1.732
  %t805 = load i64, ptr %local.x2.727
  %t806 = load i64, ptr %local.t2.737
  %t807 = load i64, ptr %local.m.730
  %t808 = load i64, ptr %local.c_val.738
  %t809 = call i64 @"coord_grad"(i64 %t805, i64 %t806, i64 %t807, i64 %t808)
  store i64 %t809, ptr %local.g2.733
  %t810 = load i64, ptr %local.x0.725
  %t811 = load i64, ptr %local.lr.728
  %t812 = load i64, ptr %local.g0.731
  %t813 = call i64 @"sx_f64_mul"(i64 %t811, i64 %t812)
  %t814 = call i64 @"sx_f64_add"(i64 %t810, i64 %t813)
  %t815 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.168)
  %t816 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.169)
  %t817 = call i64 @"clamp"(i64 %t814, i64 %t815, i64 %t816)
  store i64 %t817, ptr %local.x0.725
  %t818 = load i64, ptr %local.x1.726
  %t819 = load i64, ptr %local.lr.728
  %t820 = load i64, ptr %local.g1.732
  %t821 = call i64 @"sx_f64_mul"(i64 %t819, i64 %t820)
  %t822 = call i64 @"sx_f64_add"(i64 %t818, i64 %t821)
  %t823 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.170)
  %t824 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.171)
  %t825 = call i64 @"clamp"(i64 %t822, i64 %t823, i64 %t824)
  store i64 %t825, ptr %local.x1.726
  %t826 = load i64, ptr %local.x2.727
  %t827 = load i64, ptr %local.lr.728
  %t828 = load i64, ptr %local.g2.733
  %t829 = call i64 @"sx_f64_mul"(i64 %t827, i64 %t828)
  %t830 = call i64 @"sx_f64_add"(i64 %t826, i64 %t829)
  %t831 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.172)
  %t832 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.173)
  %t833 = call i64 @"clamp"(i64 %t830, i64 %t831, i64 %t832)
  store i64 %t833, ptr %local.x2.727
  %t834 = load i64, ptr %local.step.729
  %t835 = srem i64 %t834, 25
  %t836 = icmp eq i64 %t835, 0
  %t837 = zext i1 %t836 to i64
  %t838 = icmp ne i64 %t837, 0
  br i1 %t838, label %then23, label %else23
then23:
  %t839 = load i64, ptr %local.x0.725
  %t840 = load i64, ptr %local.x1.726
  %t841 = load i64, ptr %local.x2.727
  %t842 = call i64 @"coord_mean"(i64 %t839, i64 %t840, i64 %t841)
  store i64 %t842, ptr %local.m.730
  %t843 = load i64, ptr %local.x0.725
  %t844 = load i64, ptr %local.m.730
  %t845 = call i64 @"sx_f64_sub"(i64 %t843, i64 %t844)
  %t846 = load i64, ptr %local.x0.725
  %t847 = load i64, ptr %local.m.730
  %t848 = call i64 @"sx_f64_sub"(i64 %t846, i64 %t847)
  %t849 = call i64 @"sx_f64_mul"(i64 %t845, i64 %t848)
  %t850 = load i64, ptr %local.x1.726
  %t851 = load i64, ptr %local.m.730
  %t852 = call i64 @"sx_f64_sub"(i64 %t850, i64 %t851)
  %t853 = load i64, ptr %local.x1.726
  %t854 = load i64, ptr %local.m.730
  %t855 = call i64 @"sx_f64_sub"(i64 %t853, i64 %t854)
  %t856 = call i64 @"sx_f64_mul"(i64 %t852, i64 %t855)
  %t857 = call i64 @"sx_f64_add"(i64 %t849, i64 %t856)
  %t858 = load i64, ptr %local.x2.727
  %t859 = load i64, ptr %local.m.730
  %t860 = call i64 @"sx_f64_sub"(i64 %t858, i64 %t859)
  %t861 = load i64, ptr %local.x2.727
  %t862 = load i64, ptr %local.m.730
  %t863 = call i64 @"sx_f64_sub"(i64 %t861, i64 %t862)
  %t864 = call i64 @"sx_f64_mul"(i64 %t860, i64 %t863)
  %t865 = call i64 @"sx_f64_add"(i64 %t857, i64 %t864)
  %t866 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.174)
  %t867 = call i64 @"sx_f64_div"(i64 %t865, i64 %t866)
  %t868 = call i64 @"sqrt_f64"(i64 %t867)
  store i64 %t868, ptr %local.dist.734
  %t869 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.175)
  %t870 = ptrtoint ptr %t869 to i64
  %t871 = inttoptr i64 %t870 to ptr
  call void @intrinsic_print(ptr %t871)
  %t872 = load i64, ptr %local.step.729
  call void @print_i64(i64 %t872)
  %t873 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.176)
  %t874 = ptrtoint ptr %t873 to i64
  %t875 = inttoptr i64 %t874 to ptr
  call void @intrinsic_print(ptr %t875)
  %t876 = load i64, ptr %local.x0.725
  %t877 = call i64 @"print_f64"(i64 %t876)
  %t878 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.177)
  %t879 = ptrtoint ptr %t878 to i64
  %t880 = inttoptr i64 %t879 to ptr
  call void @intrinsic_print(ptr %t880)
  %t881 = load i64, ptr %local.x1.726
  %t882 = call i64 @"print_f64"(i64 %t881)
  %t883 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.178)
  %t884 = ptrtoint ptr %t883 to i64
  %t885 = inttoptr i64 %t884 to ptr
  call void @intrinsic_print(ptr %t885)
  %t886 = load i64, ptr %local.x2.727
  %t887 = call i64 @"print_f64"(i64 %t886)
  %t888 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.179)
  %t889 = ptrtoint ptr %t888 to i64
  %t890 = inttoptr i64 %t889 to ptr
  call void @intrinsic_print(ptr %t890)
  %t891 = load i64, ptr %local.m.730
  %t892 = call i64 @"print_f64"(i64 %t891)
  %t893 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.180)
  %t894 = ptrtoint ptr %t893 to i64
  %t895 = inttoptr i64 %t894 to ptr
  call void @intrinsic_print(ptr %t895)
  %t896 = load i64, ptr %local.dist.734
  %t897 = call i64 @"print_f64"(i64 %t896)
  %t898 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.181)
  %t899 = ptrtoint ptr %t898 to i64
  %t900 = inttoptr i64 %t899 to ptr
  call void @intrinsic_println(ptr %t900)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t901 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t902 = load i64, ptr %local.step.729
  %t903 = add i64 %t902, 1
  store i64 %t903, ptr %local.step.729
  br label %loop22
endloop22:
  %t904 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.182)
  %t905 = ptrtoint ptr %t904 to i64
  %t906 = inttoptr i64 %t905 to ptr
  call void @intrinsic_println(ptr %t906)
  %t907 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.183)
  %t908 = ptrtoint ptr %t907 to i64
  %t909 = inttoptr i64 %t908 to ptr
  call void @intrinsic_println(ptr %t909)
  %t910 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.184)
  %t911 = ptrtoint ptr %t910 to i64
  %t912 = inttoptr i64 %t911 to ptr
  call void @intrinsic_println(ptr %t912)
  %t913 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.185)
  %t914 = ptrtoint ptr %t913 to i64
  %t915 = inttoptr i64 %t914 to ptr
  call void @intrinsic_println(ptr %t915)
  %t916 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.186)
  %t917 = call i64 @"run_coordination"(i64 %t916)
  store i64 %t917, ptr %local.sp0.739
  %t918 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.187)
  %t919 = ptrtoint ptr %t918 to i64
  %t920 = inttoptr i64 %t919 to ptr
  call void @intrinsic_print(ptr %t920)
  %t921 = load i64, ptr %local.sp0.739
  %t922 = call i64 @"print_f64"(i64 %t921)
  %t923 = load i64, ptr %local.sp0.739
  %t924 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.188)
  %t925 = call i64 @"sx_f64_gt"(i64 %t923, i64 %t924)
  %t926 = icmp ne i64 %t925, 0
  br i1 %t926, label %then24, label %else24
then24:
  %t927 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.189)
  %t928 = ptrtoint ptr %t927 to i64
  %t929 = inttoptr i64 %t928 to ptr
  call void @intrinsic_println(ptr %t929)
  br label %then24_end
then24_end:
  br label %endif24
else24:
  %t930 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.190)
  %t931 = ptrtoint ptr %t930 to i64
  %t932 = inttoptr i64 %t931 to ptr
  call void @intrinsic_println(ptr %t932)
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t933 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t934 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.191)
  %t935 = call i64 @"run_coordination"(i64 %t934)
  store i64 %t935, ptr %local.sp1.740
  %t936 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.192)
  %t937 = ptrtoint ptr %t936 to i64
  %t938 = inttoptr i64 %t937 to ptr
  call void @intrinsic_print(ptr %t938)
  %t939 = load i64, ptr %local.sp1.740
  %t940 = call i64 @"print_f64"(i64 %t939)
  %t941 = load i64, ptr %local.sp1.740
  %t942 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.193)
  %t943 = call i64 @"sx_f64_gt"(i64 %t941, i64 %t942)
  %t944 = icmp ne i64 %t943, 0
  br i1 %t944, label %then25, label %else25
then25:
  %t945 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.194)
  %t946 = ptrtoint ptr %t945 to i64
  %t947 = inttoptr i64 %t946 to ptr
  call void @intrinsic_println(ptr %t947)
  br label %then25_end
then25_end:
  br label %endif25
else25:
  %t948 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.195)
  %t949 = ptrtoint ptr %t948 to i64
  %t950 = inttoptr i64 %t949 to ptr
  call void @intrinsic_println(ptr %t950)
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t951 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t952 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.196)
  %t953 = call i64 @"run_coordination"(i64 %t952)
  store i64 %t953, ptr %local.sp2.741
  %t954 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.197)
  %t955 = ptrtoint ptr %t954 to i64
  %t956 = inttoptr i64 %t955 to ptr
  call void @intrinsic_print(ptr %t956)
  %t957 = load i64, ptr %local.sp2.741
  %t958 = call i64 @"print_f64"(i64 %t957)
  %t959 = load i64, ptr %local.sp2.741
  %t960 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.198)
  %t961 = call i64 @"sx_f64_gt"(i64 %t959, i64 %t960)
  %t962 = icmp ne i64 %t961, 0
  br i1 %t962, label %then26, label %else26
then26:
  %t963 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.199)
  %t964 = ptrtoint ptr %t963 to i64
  %t965 = inttoptr i64 %t964 to ptr
  call void @intrinsic_println(ptr %t965)
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t966 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.200)
  %t967 = ptrtoint ptr %t966 to i64
  %t968 = inttoptr i64 %t967 to ptr
  call void @intrinsic_println(ptr %t968)
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t969 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t970 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.201)
  %t971 = call i64 @"run_coordination"(i64 %t970)
  store i64 %t971, ptr %local.sp3.742
  %t972 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.202)
  %t973 = ptrtoint ptr %t972 to i64
  %t974 = inttoptr i64 %t973 to ptr
  call void @intrinsic_print(ptr %t974)
  %t975 = load i64, ptr %local.sp3.742
  %t976 = call i64 @"print_f64"(i64 %t975)
  %t977 = load i64, ptr %local.sp3.742
  %t978 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.203)
  %t979 = call i64 @"sx_f64_gt"(i64 %t977, i64 %t978)
  %t980 = icmp ne i64 %t979, 0
  br i1 %t980, label %then27, label %else27
then27:
  %t981 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.204)
  %t982 = ptrtoint ptr %t981 to i64
  %t983 = inttoptr i64 %t982 to ptr
  call void @intrinsic_println(ptr %t983)
  br label %then27_end
then27_end:
  br label %endif27
else27:
  %t984 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.205)
  %t985 = ptrtoint ptr %t984 to i64
  %t986 = inttoptr i64 %t985 to ptr
  call void @intrinsic_println(ptr %t986)
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t987 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t988 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.206)
  %t989 = call i64 @"run_coordination"(i64 %t988)
  store i64 %t989, ptr %local.sp4.743
  %t990 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.207)
  %t991 = ptrtoint ptr %t990 to i64
  %t992 = inttoptr i64 %t991 to ptr
  call void @intrinsic_print(ptr %t992)
  %t993 = load i64, ptr %local.sp4.743
  %t994 = call i64 @"print_f64"(i64 %t993)
  %t995 = load i64, ptr %local.sp4.743
  %t996 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.208)
  %t997 = call i64 @"sx_f64_gt"(i64 %t995, i64 %t996)
  %t998 = icmp ne i64 %t997, 0
  br i1 %t998, label %then28, label %else28
then28:
  %t999 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.209)
  %t1000 = ptrtoint ptr %t999 to i64
  %t1001 = inttoptr i64 %t1000 to ptr
  call void @intrinsic_println(ptr %t1001)
  br label %then28_end
then28_end:
  br label %endif28
else28:
  %t1002 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.210)
  %t1003 = ptrtoint ptr %t1002 to i64
  %t1004 = inttoptr i64 %t1003 to ptr
  call void @intrinsic_println(ptr %t1004)
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1005 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t1006 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.211)
  %t1007 = call i64 @"run_coordination"(i64 %t1006)
  store i64 %t1007, ptr %local.sp5.744
  %t1008 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.212)
  %t1009 = ptrtoint ptr %t1008 to i64
  %t1010 = inttoptr i64 %t1009 to ptr
  call void @intrinsic_print(ptr %t1010)
  %t1011 = load i64, ptr %local.sp5.744
  %t1012 = call i64 @"print_f64"(i64 %t1011)
  %t1013 = load i64, ptr %local.sp5.744
  %t1014 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.213)
  %t1015 = call i64 @"sx_f64_gt"(i64 %t1013, i64 %t1014)
  %t1016 = icmp ne i64 %t1015, 0
  br i1 %t1016, label %then29, label %else29
then29:
  %t1017 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.214)
  %t1018 = ptrtoint ptr %t1017 to i64
  %t1019 = inttoptr i64 %t1018 to ptr
  call void @intrinsic_println(ptr %t1019)
  br label %then29_end
then29_end:
  br label %endif29
else29:
  %t1020 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.215)
  %t1021 = ptrtoint ptr %t1020 to i64
  %t1022 = inttoptr i64 %t1021 to ptr
  call void @intrinsic_println(ptr %t1022)
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1023 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t1024 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.216)
  %t1025 = call i64 @"run_coordination"(i64 %t1024)
  store i64 %t1025, ptr %local.sp6.745
  %t1026 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.217)
  %t1027 = ptrtoint ptr %t1026 to i64
  %t1028 = inttoptr i64 %t1027 to ptr
  call void @intrinsic_print(ptr %t1028)
  %t1029 = load i64, ptr %local.sp6.745
  %t1030 = call i64 @"print_f64"(i64 %t1029)
  %t1031 = load i64, ptr %local.sp6.745
  %t1032 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.218)
  %t1033 = call i64 @"sx_f64_gt"(i64 %t1031, i64 %t1032)
  %t1034 = icmp ne i64 %t1033, 0
  br i1 %t1034, label %then30, label %else30
then30:
  %t1035 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.219)
  %t1036 = ptrtoint ptr %t1035 to i64
  %t1037 = inttoptr i64 %t1036 to ptr
  call void @intrinsic_println(ptr %t1037)
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t1038 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.220)
  %t1039 = ptrtoint ptr %t1038 to i64
  %t1040 = inttoptr i64 %t1039 to ptr
  call void @intrinsic_println(ptr %t1040)
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1041 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t1042 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.221)
  %t1043 = ptrtoint ptr %t1042 to i64
  %t1044 = inttoptr i64 %t1043 to ptr
  call void @intrinsic_println(ptr %t1044)
  %t1045 = load i64, ptr %local.sp6.745
  %t1046 = load i64, ptr %local.sp0.739
  %t1047 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.222)
  %t1048 = call i64 @"sx_f64_add"(i64 %t1046, i64 %t1047)
  %t1049 = call i64 @"sx_f64_div"(i64 %t1045, i64 %t1048)
  store i64 %t1049, ptr %local.ratio.746
  %t1050 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.223)
  %t1051 = ptrtoint ptr %t1050 to i64
  %t1052 = inttoptr i64 %t1051 to ptr
  call void @intrinsic_print(ptr %t1052)
  %t1053 = load i64, ptr %local.ratio.746
  %t1054 = call i64 @"print_f64"(i64 %t1053)
  %t1055 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.224)
  %t1056 = ptrtoint ptr %t1055 to i64
  %t1057 = inttoptr i64 %t1056 to ptr
  call void @intrinsic_println(ptr %t1057)
  %t1058 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.225)
  %t1059 = ptrtoint ptr %t1058 to i64
  %t1060 = inttoptr i64 %t1059 to ptr
  call void @intrinsic_println(ptr %t1060)
  %t1061 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.226)
  %t1062 = ptrtoint ptr %t1061 to i64
  %t1063 = inttoptr i64 %t1062 to ptr
  call void @intrinsic_println(ptr %t1063)
  %t1064 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.227)
  %t1065 = ptrtoint ptr %t1064 to i64
  %t1066 = inttoptr i64 %t1065 to ptr
  call void @intrinsic_println(ptr %t1066)
  %t1067 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.228)
  %t1068 = ptrtoint ptr %t1067 to i64
  %t1069 = inttoptr i64 %t1068 to ptr
  call void @intrinsic_println(ptr %t1069)
  ret i64 0
}

define i64 @"pd_payoff"(i64 %p1, i64 %p2) nounwind {
entry:
  %local.p1 = alloca i64
  store i64 %p1, ptr %local.p1
  %local.p2 = alloca i64
  store i64 %p2, ptr %local.p2
  %t1070 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.229)
  %t1071 = load i64, ptr %local.p1
  %t1072 = load i64, ptr %local.p2
  %t1073 = call i64 @"sx_f64_mul"(i64 %t1071, i64 %t1072)
  %t1074 = call i64 @"sx_f64_sub"(i64 %t1070, i64 %t1073)
  %t1075 = load i64, ptr %local.p1
  %t1076 = call i64 @"sx_f64_sub"(i64 %t1074, i64 %t1075)
  %t1077 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.230)
  %t1078 = load i64, ptr %local.p2
  %t1079 = call i64 @"sx_f64_mul"(i64 %t1077, i64 %t1078)
  %t1080 = call i64 @"sx_f64_add"(i64 %t1076, i64 %t1079)
  %t1081 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.231)
  %t1082 = call i64 @"sx_f64_add"(i64 %t1080, i64 %t1081)
  ret i64 %t1082
}

define i64 @"pd_payoff_p2"(i64 %p1, i64 %p2) nounwind {
entry:
  %local.p1 = alloca i64
  store i64 %p1, ptr %local.p1
  %local.p2 = alloca i64
  store i64 %p2, ptr %local.p2
  %t1083 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.232)
  %t1084 = load i64, ptr %local.p1
  %t1085 = load i64, ptr %local.p2
  %t1086 = call i64 @"sx_f64_mul"(i64 %t1084, i64 %t1085)
  %t1087 = call i64 @"sx_f64_sub"(i64 %t1083, i64 %t1086)
  %t1088 = load i64, ptr %local.p2
  %t1089 = call i64 @"sx_f64_sub"(i64 %t1087, i64 %t1088)
  %t1090 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.233)
  %t1091 = load i64, ptr %local.p1
  %t1092 = call i64 @"sx_f64_mul"(i64 %t1090, i64 %t1091)
  %t1093 = call i64 @"sx_f64_add"(i64 %t1089, i64 %t1092)
  %t1094 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.234)
  %t1095 = call i64 @"sx_f64_add"(i64 %t1093, i64 %t1094)
  ret i64 %t1095
}

define i64 @"pd_grad_p1"(i64 %p2) nounwind {
entry:
  %local.p2 = alloca i64
  store i64 %p2, ptr %local.p2
  %t1096 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.235)
  %t1097 = load i64, ptr %local.p2
  %t1098 = call i64 @"sx_f64_sub"(i64 %t1096, i64 %t1097)
  %t1099 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.236)
  %t1100 = call i64 @"sx_f64_sub"(i64 %t1098, i64 %t1099)
  ret i64 %t1100
}

define i64 @"pd_grad_p2"(i64 %p1) nounwind {
entry:
  %local.p1 = alloca i64
  store i64 %p1, ptr %local.p1
  %t1101 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.237)
  %t1102 = load i64, ptr %local.p1
  %t1103 = call i64 @"sx_f64_sub"(i64 %t1101, i64 %t1102)
  %t1104 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.238)
  %t1105 = call i64 @"sx_f64_sub"(i64 %t1103, i64 %t1104)
  ret i64 %t1105
}

define i64 @"run_pd"(i64 %desire, i64 %coupling) nounwind {
entry:
  %local.p1.1106 = alloca i64
  %local.p2.1107 = alloca i64
  %local.lr.1108 = alloca i64
  %local.step.1109 = alloca i64
  %local.g1.1110 = alloca i64
  %local.g2.1111 = alloca i64
  %local.desire_push1.1112 = alloca i64
  %local.desire_push2.1113 = alloca i64
  %local.desire = alloca i64
  store i64 %desire, ptr %local.desire
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %t1114 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.239)
  store i64 %t1114, ptr %local.p1.1106
  %t1115 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.240)
  store i64 %t1115, ptr %local.p2.1107
  %t1116 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.241)
  store i64 %t1116, ptr %local.lr.1108
  store i64 0, ptr %local.step.1109
  %t1117 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.242)
  store i64 %t1117, ptr %local.g1.1110
  %t1118 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.243)
  store i64 %t1118, ptr %local.g2.1111
  %t1119 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.244)
  store i64 %t1119, ptr %local.desire_push1.1112
  %t1120 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.245)
  store i64 %t1120, ptr %local.desire_push2.1113
  br label %loop31
loop31:
  %t1121 = load i64, ptr %local.step.1109
  %t1122 = icmp slt i64 %t1121, 200
  %t1123 = zext i1 %t1122 to i64
  %t1124 = icmp ne i64 %t1123, 0
  br i1 %t1124, label %body31, label %endloop31
body31:
  %t1125 = load i64, ptr %local.p2.1107
  %t1126 = call i64 @"pd_grad_p1"(i64 %t1125)
  store i64 %t1126, ptr %local.g1.1110
  %t1127 = load i64, ptr %local.p1.1106
  %t1128 = call i64 @"pd_grad_p2"(i64 %t1127)
  store i64 %t1128, ptr %local.g2.1111
  %t1129 = load i64, ptr %local.coupling
  %t1130 = load i64, ptr %local.desire
  %t1131 = load i64, ptr %local.p1.1106
  %t1132 = call i64 @"sx_f64_sub"(i64 %t1130, i64 %t1131)
  %t1133 = call i64 @"sx_f64_mul"(i64 %t1129, i64 %t1132)
  store i64 %t1133, ptr %local.desire_push1.1112
  %t1134 = load i64, ptr %local.coupling
  %t1135 = load i64, ptr %local.desire
  %t1136 = load i64, ptr %local.p2.1107
  %t1137 = call i64 @"sx_f64_sub"(i64 %t1135, i64 %t1136)
  %t1138 = call i64 @"sx_f64_mul"(i64 %t1134, i64 %t1137)
  store i64 %t1138, ptr %local.desire_push2.1113
  %t1139 = load i64, ptr %local.p1.1106
  %t1140 = load i64, ptr %local.lr.1108
  %t1141 = load i64, ptr %local.g1.1110
  %t1142 = load i64, ptr %local.desire_push1.1112
  %t1143 = call i64 @"sx_f64_add"(i64 %t1141, i64 %t1142)
  %t1144 = call i64 @"sx_f64_mul"(i64 %t1140, i64 %t1143)
  %t1145 = call i64 @"sx_f64_add"(i64 %t1139, i64 %t1144)
  %t1146 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.246)
  %t1147 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.247)
  %t1148 = call i64 @"clamp"(i64 %t1145, i64 %t1146, i64 %t1147)
  store i64 %t1148, ptr %local.p1.1106
  %t1149 = load i64, ptr %local.p2.1107
  %t1150 = load i64, ptr %local.lr.1108
  %t1151 = load i64, ptr %local.g2.1111
  %t1152 = load i64, ptr %local.desire_push2.1113
  %t1153 = call i64 @"sx_f64_add"(i64 %t1151, i64 %t1152)
  %t1154 = call i64 @"sx_f64_mul"(i64 %t1150, i64 %t1153)
  %t1155 = call i64 @"sx_f64_add"(i64 %t1149, i64 %t1154)
  %t1156 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.248)
  %t1157 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.249)
  %t1158 = call i64 @"clamp"(i64 %t1155, i64 %t1156, i64 %t1157)
  store i64 %t1158, ptr %local.p2.1107
  %t1159 = load i64, ptr %local.step.1109
  %t1160 = add i64 %t1159, 1
  store i64 %t1160, ptr %local.step.1109
  br label %loop31
endloop31:
  %t1161 = load i64, ptr %local.p1.1106
  %t1162 = load i64, ptr %local.p2.1107
  %t1163 = call i64 @"pd_payoff"(i64 %t1161, i64 %t1162)
  %t1164 = load i64, ptr %local.p1.1106
  %t1165 = load i64, ptr %local.p2.1107
  %t1166 = call i64 @"pd_payoff_p2"(i64 %t1164, i64 %t1165)
  %t1167 = call i64 @"sx_f64_add"(i64 %t1163, i64 %t1166)
  ret i64 %t1167
}

define i64 @"run_pd_detailed"(i64 %desire, i64 %coupling, i64 %label) nounwind {
entry:
  %local.p1.1168 = alloca i64
  %local.p2.1169 = alloca i64
  %local.lr.1170 = alloca i64
  %local.step.1171 = alloca i64
  %local.g1.1172 = alloca i64
  %local.g2.1173 = alloca i64
  %local.dp1.1174 = alloca i64
  %local.dp2.1175 = alloca i64
  %local.welfare.1176 = alloca i64
  %local.desire = alloca i64
  store i64 %desire, ptr %local.desire
  %local.coupling = alloca i64
  store i64 %coupling, ptr %local.coupling
  %local.label = alloca i64
  store i64 %label, ptr %local.label
  %t1177 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.250)
  store i64 %t1177, ptr %local.p1.1168
  %t1178 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.251)
  store i64 %t1178, ptr %local.p2.1169
  %t1179 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.252)
  store i64 %t1179, ptr %local.lr.1170
  store i64 0, ptr %local.step.1171
  %t1180 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.253)
  store i64 %t1180, ptr %local.g1.1172
  %t1181 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.254)
  store i64 %t1181, ptr %local.g2.1173
  %t1182 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.255)
  store i64 %t1182, ptr %local.dp1.1174
  %t1183 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.256)
  store i64 %t1183, ptr %local.dp2.1175
  %t1184 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.257)
  store i64 %t1184, ptr %local.welfare.1176
  br label %loop32
loop32:
  %t1185 = load i64, ptr %local.step.1171
  %t1186 = icmp slt i64 %t1185, 200
  %t1187 = zext i1 %t1186 to i64
  %t1188 = icmp ne i64 %t1187, 0
  br i1 %t1188, label %body32, label %endloop32
body32:
  %t1189 = load i64, ptr %local.p2.1169
  %t1190 = call i64 @"pd_grad_p1"(i64 %t1189)
  store i64 %t1190, ptr %local.g1.1172
  %t1191 = load i64, ptr %local.p1.1168
  %t1192 = call i64 @"pd_grad_p2"(i64 %t1191)
  store i64 %t1192, ptr %local.g2.1173
  %t1193 = load i64, ptr %local.coupling
  %t1194 = load i64, ptr %local.desire
  %t1195 = load i64, ptr %local.p1.1168
  %t1196 = call i64 @"sx_f64_sub"(i64 %t1194, i64 %t1195)
  %t1197 = call i64 @"sx_f64_mul"(i64 %t1193, i64 %t1196)
  store i64 %t1197, ptr %local.dp1.1174
  %t1198 = load i64, ptr %local.coupling
  %t1199 = load i64, ptr %local.desire
  %t1200 = load i64, ptr %local.p2.1169
  %t1201 = call i64 @"sx_f64_sub"(i64 %t1199, i64 %t1200)
  %t1202 = call i64 @"sx_f64_mul"(i64 %t1198, i64 %t1201)
  store i64 %t1202, ptr %local.dp2.1175
  %t1203 = load i64, ptr %local.p1.1168
  %t1204 = load i64, ptr %local.lr.1170
  %t1205 = load i64, ptr %local.g1.1172
  %t1206 = load i64, ptr %local.dp1.1174
  %t1207 = call i64 @"sx_f64_add"(i64 %t1205, i64 %t1206)
  %t1208 = call i64 @"sx_f64_mul"(i64 %t1204, i64 %t1207)
  %t1209 = call i64 @"sx_f64_add"(i64 %t1203, i64 %t1208)
  %t1210 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.258)
  %t1211 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.259)
  %t1212 = call i64 @"clamp"(i64 %t1209, i64 %t1210, i64 %t1211)
  store i64 %t1212, ptr %local.p1.1168
  %t1213 = load i64, ptr %local.p2.1169
  %t1214 = load i64, ptr %local.lr.1170
  %t1215 = load i64, ptr %local.g2.1173
  %t1216 = load i64, ptr %local.dp2.1175
  %t1217 = call i64 @"sx_f64_add"(i64 %t1215, i64 %t1216)
  %t1218 = call i64 @"sx_f64_mul"(i64 %t1214, i64 %t1217)
  %t1219 = call i64 @"sx_f64_add"(i64 %t1213, i64 %t1218)
  %t1220 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.260)
  %t1221 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.261)
  %t1222 = call i64 @"clamp"(i64 %t1219, i64 %t1220, i64 %t1221)
  store i64 %t1222, ptr %local.p2.1169
  %t1223 = load i64, ptr %local.step.1171
  %t1224 = add i64 %t1223, 1
  store i64 %t1224, ptr %local.step.1171
  br label %loop32
endloop32:
  %t1225 = load i64, ptr %local.p1.1168
  %t1226 = load i64, ptr %local.p2.1169
  %t1227 = call i64 @"pd_payoff"(i64 %t1225, i64 %t1226)
  %t1228 = load i64, ptr %local.p1.1168
  %t1229 = load i64, ptr %local.p2.1169
  %t1230 = call i64 @"pd_payoff_p2"(i64 %t1228, i64 %t1229)
  %t1231 = call i64 @"sx_f64_add"(i64 %t1227, i64 %t1230)
  store i64 %t1231, ptr %local.welfare.1176
  %t1232 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.262)
  %t1233 = ptrtoint ptr %t1232 to i64
  %t1234 = inttoptr i64 %t1233 to ptr
  call void @intrinsic_print(ptr %t1234)
  %t1235 = load i64, ptr %local.p1.1168
  %t1236 = call i64 @"print_f64"(i64 %t1235)
  %t1237 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.263)
  %t1238 = ptrtoint ptr %t1237 to i64
  %t1239 = inttoptr i64 %t1238 to ptr
  call void @intrinsic_print(ptr %t1239)
  %t1240 = load i64, ptr %local.p2.1169
  %t1241 = call i64 @"print_f64"(i64 %t1240)
  %t1242 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.264)
  %t1243 = ptrtoint ptr %t1242 to i64
  %t1244 = inttoptr i64 %t1243 to ptr
  call void @intrinsic_print(ptr %t1244)
  %t1245 = load i64, ptr %local.welfare.1176
  %t1246 = call i64 @"print_f64"(i64 %t1245)
  %t1247 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.265)
  %t1248 = ptrtoint ptr %t1247 to i64
  %t1249 = inttoptr i64 %t1248 to ptr
  call void @intrinsic_print(ptr %t1249)
  %t1250 = load i64, ptr %local.welfare.1176
  %t1251 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.266)
  %t1252 = call i64 @"sx_f64_div"(i64 %t1250, i64 %t1251)
  %t1253 = call i64 @"print_f64"(i64 %t1252)
  %t1254 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.267)
  %t1255 = ptrtoint ptr %t1254 to i64
  %t1256 = inttoptr i64 %t1255 to ptr
  call void @intrinsic_println(ptr %t1256)
  %t1257 = load i64, ptr %local.welfare.1176
  ret i64 %t1257
}

define i64 @"test_prisoners_dilemma"() nounwind {
entry:
  %local.w_none.1258 = alloca i64
  %local.w_coop_low.1259 = alloca i64
  %local.w_coop_mid.1260 = alloca i64
  %local.w_coop_hi.1261 = alloca i64
  %local.w_skept.1262 = alloca i64
  %local.w_defect.1263 = alloca i64
  %local.gain.1264 = alloca i64
  %local.c_sweep.1265 = alloca i64
  %local.best_w.1266 = alloca i64
  %local.best_c.1267 = alloca i64
  %local.w_val.1268 = alloca i64
  %local.sweep_step.1269 = alloca i64
  %local.pareto_frac.1270 = alloca i64
  %t1271 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.268)
  %t1272 = ptrtoint ptr %t1271 to i64
  %t1273 = inttoptr i64 %t1272 to ptr
  call void @intrinsic_println(ptr %t1273)
  %t1274 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.269)
  %t1275 = ptrtoint ptr %t1274 to i64
  %t1276 = inttoptr i64 %t1275 to ptr
  call void @intrinsic_println(ptr %t1276)
  %t1277 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.270)
  %t1278 = ptrtoint ptr %t1277 to i64
  %t1279 = inttoptr i64 %t1278 to ptr
  call void @intrinsic_println(ptr %t1279)
  %t1280 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.271)
  %t1281 = ptrtoint ptr %t1280 to i64
  %t1282 = inttoptr i64 %t1281 to ptr
  call void @intrinsic_println(ptr %t1282)
  %t1283 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.272)
  %t1284 = ptrtoint ptr %t1283 to i64
  %t1285 = inttoptr i64 %t1284 to ptr
  call void @intrinsic_println(ptr %t1285)
  %t1286 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.273)
  %t1287 = ptrtoint ptr %t1286 to i64
  %t1288 = inttoptr i64 %t1287 to ptr
  call void @intrinsic_println(ptr %t1288)
  %t1289 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.274)
  %t1290 = ptrtoint ptr %t1289 to i64
  %t1291 = inttoptr i64 %t1290 to ptr
  call void @intrinsic_println(ptr %t1291)
  %t1292 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.275)
  %t1293 = ptrtoint ptr %t1292 to i64
  %t1294 = inttoptr i64 %t1293 to ptr
  call void @intrinsic_println(ptr %t1294)
  %t1295 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.276)
  %t1296 = ptrtoint ptr %t1295 to i64
  %t1297 = inttoptr i64 %t1296 to ptr
  call void @intrinsic_print(ptr %t1297)
  %t1298 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.277)
  %t1299 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.278)
  %t1300 = call i64 @"run_pd_detailed"(i64 %t1298, i64 %t1299, i64 0)
  store i64 %t1300, ptr %local.w_none.1258
  %t1301 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.279)
  %t1302 = ptrtoint ptr %t1301 to i64
  %t1303 = inttoptr i64 %t1302 to ptr
  call void @intrinsic_println(ptr %t1303)
  %t1304 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.280)
  %t1305 = ptrtoint ptr %t1304 to i64
  %t1306 = inttoptr i64 %t1305 to ptr
  call void @intrinsic_print(ptr %t1306)
  %t1307 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.281)
  %t1308 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.282)
  %t1309 = call i64 @"run_pd_detailed"(i64 %t1307, i64 %t1308, i64 1)
  store i64 %t1309, ptr %local.w_coop_low.1259
  %t1310 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.283)
  %t1311 = ptrtoint ptr %t1310 to i64
  %t1312 = inttoptr i64 %t1311 to ptr
  call void @intrinsic_println(ptr %t1312)
  %t1313 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.284)
  %t1314 = ptrtoint ptr %t1313 to i64
  %t1315 = inttoptr i64 %t1314 to ptr
  call void @intrinsic_print(ptr %t1315)
  %t1316 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.285)
  %t1317 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.286)
  %t1318 = call i64 @"run_pd_detailed"(i64 %t1316, i64 %t1317, i64 2)
  store i64 %t1318, ptr %local.w_coop_mid.1260
  %t1319 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.287)
  %t1320 = ptrtoint ptr %t1319 to i64
  %t1321 = inttoptr i64 %t1320 to ptr
  call void @intrinsic_println(ptr %t1321)
  %t1322 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.288)
  %t1323 = ptrtoint ptr %t1322 to i64
  %t1324 = inttoptr i64 %t1323 to ptr
  call void @intrinsic_print(ptr %t1324)
  %t1325 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.289)
  %t1326 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.290)
  %t1327 = call i64 @"run_pd_detailed"(i64 %t1325, i64 %t1326, i64 3)
  store i64 %t1327, ptr %local.w_coop_hi.1261
  %t1328 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.291)
  %t1329 = ptrtoint ptr %t1328 to i64
  %t1330 = inttoptr i64 %t1329 to ptr
  call void @intrinsic_println(ptr %t1330)
  %t1331 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.292)
  %t1332 = ptrtoint ptr %t1331 to i64
  %t1333 = inttoptr i64 %t1332 to ptr
  call void @intrinsic_print(ptr %t1333)
  %t1334 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.293)
  %t1335 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.294)
  %t1336 = call i64 @"run_pd_detailed"(i64 %t1334, i64 %t1335, i64 4)
  store i64 %t1336, ptr %local.w_skept.1262
  %t1337 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.295)
  %t1338 = ptrtoint ptr %t1337 to i64
  %t1339 = inttoptr i64 %t1338 to ptr
  call void @intrinsic_println(ptr %t1339)
  %t1340 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.296)
  %t1341 = ptrtoint ptr %t1340 to i64
  %t1342 = inttoptr i64 %t1341 to ptr
  call void @intrinsic_print(ptr %t1342)
  %t1343 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.297)
  %t1344 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.298)
  %t1345 = call i64 @"run_pd_detailed"(i64 %t1343, i64 %t1344, i64 5)
  store i64 %t1345, ptr %local.w_defect.1263
  %t1346 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.299)
  %t1347 = ptrtoint ptr %t1346 to i64
  %t1348 = inttoptr i64 %t1347 to ptr
  call void @intrinsic_println(ptr %t1348)
  %t1349 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.300)
  %t1350 = ptrtoint ptr %t1349 to i64
  %t1351 = inttoptr i64 %t1350 to ptr
  call void @intrinsic_println(ptr %t1351)
  %t1352 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.301)
  %t1353 = ptrtoint ptr %t1352 to i64
  %t1354 = inttoptr i64 %t1353 to ptr
  call void @intrinsic_println(ptr %t1354)
  %t1355 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.302)
  %t1356 = ptrtoint ptr %t1355 to i64
  %t1357 = inttoptr i64 %t1356 to ptr
  call void @intrinsic_println(ptr %t1357)
  %t1358 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.303)
  %t1359 = ptrtoint ptr %t1358 to i64
  %t1360 = inttoptr i64 %t1359 to ptr
  call void @intrinsic_print(ptr %t1360)
  %t1361 = load i64, ptr %local.w_none.1258
  %t1362 = call i64 @"print_f64"(i64 %t1361)
  %t1363 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.304)
  %t1364 = ptrtoint ptr %t1363 to i64
  %t1365 = inttoptr i64 %t1364 to ptr
  call void @intrinsic_println(ptr %t1365)
  %t1366 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.305)
  %t1367 = ptrtoint ptr %t1366 to i64
  %t1368 = inttoptr i64 %t1367 to ptr
  call void @intrinsic_print(ptr %t1368)
  %t1369 = load i64, ptr %local.w_coop_low.1259
  %t1370 = call i64 @"print_f64"(i64 %t1369)
  %t1371 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.306)
  %t1372 = ptrtoint ptr %t1371 to i64
  %t1373 = inttoptr i64 %t1372 to ptr
  call void @intrinsic_println(ptr %t1373)
  %t1374 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.307)
  %t1375 = ptrtoint ptr %t1374 to i64
  %t1376 = inttoptr i64 %t1375 to ptr
  call void @intrinsic_print(ptr %t1376)
  %t1377 = load i64, ptr %local.w_coop_mid.1260
  %t1378 = call i64 @"print_f64"(i64 %t1377)
  %t1379 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.308)
  %t1380 = ptrtoint ptr %t1379 to i64
  %t1381 = inttoptr i64 %t1380 to ptr
  call void @intrinsic_println(ptr %t1381)
  %t1382 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.309)
  %t1383 = ptrtoint ptr %t1382 to i64
  %t1384 = inttoptr i64 %t1383 to ptr
  call void @intrinsic_print(ptr %t1384)
  %t1385 = load i64, ptr %local.w_coop_hi.1261
  %t1386 = call i64 @"print_f64"(i64 %t1385)
  %t1387 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.310)
  %t1388 = ptrtoint ptr %t1387 to i64
  %t1389 = inttoptr i64 %t1388 to ptr
  call void @intrinsic_println(ptr %t1389)
  %t1390 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.311)
  %t1391 = ptrtoint ptr %t1390 to i64
  %t1392 = inttoptr i64 %t1391 to ptr
  call void @intrinsic_print(ptr %t1392)
  %t1393 = load i64, ptr %local.w_skept.1262
  %t1394 = call i64 @"print_f64"(i64 %t1393)
  %t1395 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.312)
  %t1396 = ptrtoint ptr %t1395 to i64
  %t1397 = inttoptr i64 %t1396 to ptr
  call void @intrinsic_println(ptr %t1397)
  %t1398 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.313)
  %t1399 = ptrtoint ptr %t1398 to i64
  %t1400 = inttoptr i64 %t1399 to ptr
  call void @intrinsic_print(ptr %t1400)
  %t1401 = load i64, ptr %local.w_defect.1263
  %t1402 = call i64 @"print_f64"(i64 %t1401)
  %t1403 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.314)
  %t1404 = ptrtoint ptr %t1403 to i64
  %t1405 = inttoptr i64 %t1404 to ptr
  call void @intrinsic_println(ptr %t1405)
  %t1406 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.315)
  %t1407 = ptrtoint ptr %t1406 to i64
  %t1408 = inttoptr i64 %t1407 to ptr
  call void @intrinsic_println(ptr %t1408)
  %t1409 = load i64, ptr %local.w_coop_hi.1261
  %t1410 = load i64, ptr %local.w_none.1258
  %t1411 = call i64 @"sx_f64_gt"(i64 %t1409, i64 %t1410)
  %t1412 = icmp ne i64 %t1411, 0
  br i1 %t1412, label %then33, label %else33
then33:
  %t1413 = load i64, ptr %local.w_coop_hi.1261
  %t1414 = load i64, ptr %local.w_none.1258
  %t1415 = call i64 @"sx_f64_sub"(i64 %t1413, i64 %t1414)
  store i64 %t1415, ptr %local.gain.1264
  %t1416 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.316)
  %t1417 = ptrtoint ptr %t1416 to i64
  %t1418 = inttoptr i64 %t1417 to ptr
  call void @intrinsic_print(ptr %t1418)
  %t1419 = load i64, ptr %local.gain.1264
  %t1420 = call i64 @"print_f64"(i64 %t1419)
  %t1421 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.317)
  %t1422 = ptrtoint ptr %t1421 to i64
  %t1423 = inttoptr i64 %t1422 to ptr
  call void @intrinsic_println(ptr %t1423)
  %t1424 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.318)
  %t1425 = ptrtoint ptr %t1424 to i64
  %t1426 = inttoptr i64 %t1425 to ptr
  call void @intrinsic_println(ptr %t1426)
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1427 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t1428 = load i64, ptr %local.w_skept.1262
  %t1429 = load i64, ptr %local.w_none.1258
  %t1430 = call i64 @"sx_f64_gt"(i64 %t1428, i64 %t1429)
  %t1431 = icmp ne i64 %t1430, 0
  br i1 %t1431, label %then34, label %else34
then34:
  %t1432 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.319)
  %t1433 = ptrtoint ptr %t1432 to i64
  %t1434 = inttoptr i64 %t1433 to ptr
  call void @intrinsic_println(ptr %t1434)
  %t1435 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.320)
  %t1436 = ptrtoint ptr %t1435 to i64
  %t1437 = inttoptr i64 %t1436 to ptr
  call void @intrinsic_println(ptr %t1437)
  %t1438 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.321)
  %t1439 = ptrtoint ptr %t1438 to i64
  %t1440 = inttoptr i64 %t1439 to ptr
  call void @intrinsic_println(ptr %t1440)
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1441 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t1442 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.322)
  %t1443 = ptrtoint ptr %t1442 to i64
  %t1444 = inttoptr i64 %t1443 to ptr
  call void @intrinsic_println(ptr %t1444)
  %t1445 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.323)
  %t1446 = ptrtoint ptr %t1445 to i64
  %t1447 = inttoptr i64 %t1446 to ptr
  call void @intrinsic_println(ptr %t1447)
  %t1448 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.324)
  %t1449 = ptrtoint ptr %t1448 to i64
  %t1450 = inttoptr i64 %t1449 to ptr
  call void @intrinsic_println(ptr %t1450)
  %t1451 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.325)
  %t1452 = ptrtoint ptr %t1451 to i64
  %t1453 = inttoptr i64 %t1452 to ptr
  call void @intrinsic_println(ptr %t1453)
  %t1454 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.326)
  store i64 %t1454, ptr %local.c_sweep.1265
  %t1455 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.327)
  store i64 %t1455, ptr %local.best_w.1266
  %t1456 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.328)
  store i64 %t1456, ptr %local.best_c.1267
  %t1457 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.329)
  store i64 %t1457, ptr %local.w_val.1268
  store i64 0, ptr %local.sweep_step.1269
  br label %loop35
loop35:
  %t1458 = load i64, ptr %local.sweep_step.1269
  %t1459 = icmp slt i64 %t1458, 10
  %t1460 = zext i1 %t1459 to i64
  %t1461 = icmp ne i64 %t1460, 0
  br i1 %t1461, label %body35, label %endloop35
body35:
  %t1462 = load i64, ptr %local.sweep_step.1269
  %t1463 = call i64 @"sx_int_to_f64"(i64 %t1462)
  %t1464 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.330)
  %t1465 = call i64 @"sx_f64_mul"(i64 %t1463, i64 %t1464)
  store i64 %t1465, ptr %local.c_sweep.1265
  %t1466 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.331)
  %t1467 = load i64, ptr %local.c_sweep.1265
  %t1468 = call i64 @"run_pd"(i64 %t1466, i64 %t1467)
  store i64 %t1468, ptr %local.w_val.1268
  %t1469 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.332)
  %t1470 = ptrtoint ptr %t1469 to i64
  %t1471 = inttoptr i64 %t1470 to ptr
  call void @intrinsic_print(ptr %t1471)
  %t1472 = load i64, ptr %local.c_sweep.1265
  %t1473 = call i64 @"print_f64"(i64 %t1472)
  %t1474 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.333)
  %t1475 = ptrtoint ptr %t1474 to i64
  %t1476 = inttoptr i64 %t1475 to ptr
  call void @intrinsic_print(ptr %t1476)
  %t1477 = load i64, ptr %local.w_val.1268
  %t1478 = call i64 @"print_f64"(i64 %t1477)
  %t1479 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.334)
  %t1480 = ptrtoint ptr %t1479 to i64
  %t1481 = inttoptr i64 %t1480 to ptr
  call void @intrinsic_println(ptr %t1481)
  %t1482 = load i64, ptr %local.w_val.1268
  %t1483 = load i64, ptr %local.best_w.1266
  %t1484 = call i64 @"sx_f64_gt"(i64 %t1482, i64 %t1483)
  %t1485 = icmp ne i64 %t1484, 0
  br i1 %t1485, label %then36, label %else36
then36:
  %t1486 = load i64, ptr %local.w_val.1268
  store i64 %t1486, ptr %local.best_w.1266
  %t1487 = load i64, ptr %local.c_sweep.1265
  store i64 %t1487, ptr %local.best_c.1267
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1488 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t1489 = load i64, ptr %local.sweep_step.1269
  %t1490 = add i64 %t1489, 1
  store i64 %t1490, ptr %local.sweep_step.1269
  br label %loop35
endloop35:
  %t1491 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.335)
  %t1492 = ptrtoint ptr %t1491 to i64
  %t1493 = inttoptr i64 %t1492 to ptr
  call void @intrinsic_println(ptr %t1493)
  %t1494 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.336)
  %t1495 = ptrtoint ptr %t1494 to i64
  %t1496 = inttoptr i64 %t1495 to ptr
  call void @intrinsic_print(ptr %t1496)
  %t1497 = load i64, ptr %local.best_c.1267
  %t1498 = call i64 @"print_f64"(i64 %t1497)
  %t1499 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.337)
  %t1500 = ptrtoint ptr %t1499 to i64
  %t1501 = inttoptr i64 %t1500 to ptr
  call void @intrinsic_print(ptr %t1501)
  %t1502 = load i64, ptr %local.best_w.1266
  %t1503 = call i64 @"print_f64"(i64 %t1502)
  %t1504 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.338)
  %t1505 = ptrtoint ptr %t1504 to i64
  %t1506 = inttoptr i64 %t1505 to ptr
  call void @intrinsic_println(ptr %t1506)
  %t1507 = load i64, ptr %local.best_w.1266
  %t1508 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.339)
  %t1509 = call i64 @"sx_f64_div"(i64 %t1507, i64 %t1508)
  store i64 %t1509, ptr %local.pareto_frac.1270
  %t1510 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.340)
  %t1511 = ptrtoint ptr %t1510 to i64
  %t1512 = inttoptr i64 %t1511 to ptr
  call void @intrinsic_print(ptr %t1512)
  %t1513 = load i64, ptr %local.pareto_frac.1270
  %t1514 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.341)
  %t1515 = call i64 @"sx_f64_mul"(i64 %t1513, i64 %t1514)
  %t1516 = call i64 @"print_f64"(i64 %t1515)
  %t1517 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.342)
  %t1518 = ptrtoint ptr %t1517 to i64
  %t1519 = inttoptr i64 %t1518 to ptr
  call void @intrinsic_println(ptr %t1519)
  %t1520 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.343)
  %t1521 = ptrtoint ptr %t1520 to i64
  %t1522 = inttoptr i64 %t1521 to ptr
  call void @intrinsic_println(ptr %t1522)
  %t1523 = load i64, ptr %local.best_w.1266
  %t1524 = call i64 @f64_parse(ptr @.str.exp_nash_equilibrium.344)
  %t1525 = call i64 @"sx_f64_gt"(i64 %t1523, i64 %t1524)
  %t1526 = icmp ne i64 %t1525, 0
  br i1 %t1526, label %then37, label %else37
then37:
  %t1527 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.345)
  %t1528 = ptrtoint ptr %t1527 to i64
  %t1529 = inttoptr i64 %t1528 to ptr
  call void @intrinsic_println(ptr %t1529)
  %t1530 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.346)
  %t1531 = ptrtoint ptr %t1530 to i64
  %t1532 = inttoptr i64 %t1531 to ptr
  call void @intrinsic_println(ptr %t1532)
  %t1533 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.347)
  %t1534 = ptrtoint ptr %t1533 to i64
  %t1535 = inttoptr i64 %t1534 to ptr
  call void @intrinsic_println(ptr %t1535)
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1536 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t1537 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.348)
  %t1538 = ptrtoint ptr %t1537 to i64
  %t1539 = inttoptr i64 %t1538 to ptr
  call void @intrinsic_println(ptr %t1539)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1540 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.349)
  %t1541 = ptrtoint ptr %t1540 to i64
  %t1542 = inttoptr i64 %t1541 to ptr
  call void @intrinsic_println(ptr %t1542)
  %t1543 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.350)
  %t1544 = ptrtoint ptr %t1543 to i64
  %t1545 = inttoptr i64 %t1544 to ptr
  call void @intrinsic_println(ptr %t1545)
  %t1546 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.351)
  %t1547 = ptrtoint ptr %t1546 to i64
  %t1548 = inttoptr i64 %t1547 to ptr
  call void @intrinsic_println(ptr %t1548)
  %t1549 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.352)
  %t1550 = ptrtoint ptr %t1549 to i64
  %t1551 = inttoptr i64 %t1550 to ptr
  call void @intrinsic_println(ptr %t1551)
  %t1552 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.353)
  %t1553 = ptrtoint ptr %t1552 to i64
  %t1554 = inttoptr i64 %t1553 to ptr
  call void @intrinsic_println(ptr %t1554)
  %t1555 = call i64 @"test_zero_sum"()
  %t1556 = call i64 @"test_zero_sum_interaction"()
  %t1557 = call i64 @"test_coordination"()
  %t1558 = call i64 @"test_prisoners_dilemma"()
  %t1559 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.354)
  %t1560 = ptrtoint ptr %t1559 to i64
  %t1561 = inttoptr i64 %t1560 to ptr
  call void @intrinsic_println(ptr %t1561)
  %t1562 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.355)
  %t1563 = ptrtoint ptr %t1562 to i64
  %t1564 = inttoptr i64 %t1563 to ptr
  call void @intrinsic_println(ptr %t1564)
  %t1565 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.356)
  %t1566 = ptrtoint ptr %t1565 to i64
  %t1567 = inttoptr i64 %t1566 to ptr
  call void @intrinsic_println(ptr %t1567)
  %t1568 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.357)
  %t1569 = ptrtoint ptr %t1568 to i64
  %t1570 = inttoptr i64 %t1569 to ptr
  call void @intrinsic_println(ptr %t1570)
  %t1571 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.358)
  %t1572 = ptrtoint ptr %t1571 to i64
  %t1573 = inttoptr i64 %t1572 to ptr
  call void @intrinsic_println(ptr %t1573)
  %t1574 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.359)
  %t1575 = ptrtoint ptr %t1574 to i64
  %t1576 = inttoptr i64 %t1575 to ptr
  call void @intrinsic_println(ptr %t1576)
  %t1577 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.360)
  %t1578 = ptrtoint ptr %t1577 to i64
  %t1579 = inttoptr i64 %t1578 to ptr
  call void @intrinsic_println(ptr %t1579)
  %t1580 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.361)
  %t1581 = ptrtoint ptr %t1580 to i64
  %t1582 = inttoptr i64 %t1581 to ptr
  call void @intrinsic_println(ptr %t1582)
  %t1583 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.362)
  %t1584 = ptrtoint ptr %t1583 to i64
  %t1585 = inttoptr i64 %t1584 to ptr
  call void @intrinsic_println(ptr %t1585)
  %t1586 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.363)
  %t1587 = ptrtoint ptr %t1586 to i64
  %t1588 = inttoptr i64 %t1587 to ptr
  call void @intrinsic_println(ptr %t1588)
  %t1589 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.364)
  %t1590 = ptrtoint ptr %t1589 to i64
  %t1591 = inttoptr i64 %t1590 to ptr
  call void @intrinsic_println(ptr %t1591)
  %t1592 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.365)
  %t1593 = ptrtoint ptr %t1592 to i64
  %t1594 = inttoptr i64 %t1593 to ptr
  call void @intrinsic_println(ptr %t1594)
  %t1595 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.366)
  %t1596 = ptrtoint ptr %t1595 to i64
  %t1597 = inttoptr i64 %t1596 to ptr
  call void @intrinsic_println(ptr %t1597)
  %t1598 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.367)
  %t1599 = ptrtoint ptr %t1598 to i64
  %t1600 = inttoptr i64 %t1599 to ptr
  call void @intrinsic_println(ptr %t1600)
  %t1601 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.368)
  %t1602 = ptrtoint ptr %t1601 to i64
  %t1603 = inttoptr i64 %t1602 to ptr
  call void @intrinsic_println(ptr %t1603)
  %t1604 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.369)
  %t1605 = ptrtoint ptr %t1604 to i64
  %t1606 = inttoptr i64 %t1605 to ptr
  call void @intrinsic_println(ptr %t1606)
  %t1607 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.370)
  %t1608 = ptrtoint ptr %t1607 to i64
  %t1609 = inttoptr i64 %t1608 to ptr
  call void @intrinsic_println(ptr %t1609)
  %t1610 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.371)
  %t1611 = ptrtoint ptr %t1610 to i64
  %t1612 = inttoptr i64 %t1611 to ptr
  call void @intrinsic_println(ptr %t1612)
  %t1613 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.372)
  %t1614 = ptrtoint ptr %t1613 to i64
  %t1615 = inttoptr i64 %t1614 to ptr
  call void @intrinsic_println(ptr %t1615)
  %t1616 = call ptr @intrinsic_string_new(ptr @.str.exp_nash_equilibrium.373)
  %t1617 = ptrtoint ptr %t1616 to i64
  %t1618 = inttoptr i64 %t1617 to ptr
  call void @intrinsic_println(ptr %t1618)
  ret i64 0
}


; String constants
@.str.exp_nash_equilibrium.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.2 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_nash_equilibrium.3 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.5 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.6 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_nash_equilibrium.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.9 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_nash_equilibrium.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.11 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_nash_equilibrium.12 = private unnamed_addr constant [59 x i8] c"==========================================================\00"
@.str.exp_nash_equilibrium.13 = private unnamed_addr constant [60 x i8] c"Exp 1: 2-Player Zero-Sum Game (Asymmetric Matching Pennies)\00"
@.str.exp_nash_equilibrium.14 = private unnamed_addr constant [59 x i8] c"==========================================================\00"
@.str.exp_nash_equilibrium.15 = private unnamed_addr constant [37 x i8] c"  Payoff: AA=+3, AB=-1, BA=-1, BB=+1\00"
@.str.exp_nash_equilibrium.16 = private unnamed_addr constant [39 x i8] c"  E(p1,p2) = 6*p1*p2 - 2*p1 - 2*p2 + 1\00"
@.str.exp_nash_equilibrium.17 = private unnamed_addr constant [35 x i8] c"  Nash equilibrium: p1=1/3, p2=1/3\00"
@.str.exp_nash_equilibrium.18 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.19 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_nash_equilibrium.20 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_nash_equilibrium.21 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_nash_equilibrium.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.28 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.29 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_nash_equilibrium.30 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.31 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_nash_equilibrium.32 = private unnamed_addr constant [60 x i8] c"  Step | p1      | p2      | dist(Nash) | ratio  | interact\00"
@.str.exp_nash_equilibrium.33 = private unnamed_addr constant [61 x i8] c"  -----|---------|---------|------------|--------|----------\00"
@.str.exp_nash_equilibrium.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.35 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.37 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.38 = private unnamed_addr constant [10 x i8] c"0.0000001\00"
@.str.exp_nash_equilibrium.39 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.40 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_nash_equilibrium.41 = private unnamed_addr constant [8 x i8] c"     | \00"
@.str.exp_nash_equilibrium.42 = private unnamed_addr constant [4 x i8] c" | \00"
@.str.exp_nash_equilibrium.43 = private unnamed_addr constant [4 x i8] c" | \00"
@.str.exp_nash_equilibrium.44 = private unnamed_addr constant [4 x i8] c" | \00"
@.str.exp_nash_equilibrium.45 = private unnamed_addr constant [4 x i8] c" | \00"
@.str.exp_nash_equilibrium.46 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.47 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.48 = private unnamed_addr constant [14 x i8] c"  Final p1 = \00"
@.str.exp_nash_equilibrium.49 = private unnamed_addr constant [18 x i8] c", expected 1/3 = \00"
@.str.exp_nash_equilibrium.50 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.51 = private unnamed_addr constant [14 x i8] c"  Final p2 = \00"
@.str.exp_nash_equilibrium.52 = private unnamed_addr constant [18 x i8] c", expected 1/3 = \00"
@.str.exp_nash_equilibrium.53 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.54 = private unnamed_addr constant [28 x i8] c"  Final distance to Nash = \00"
@.str.exp_nash_equilibrium.55 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.56 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_nash_equilibrium.57 = private unnamed_addr constant [49 x i8] c"  RESULT: Converged to Nash equilibrium (S -> 0)\00"
@.str.exp_nash_equilibrium.58 = private unnamed_addr constant [52 x i8] c"  RESULT: Did NOT converge — checking oscillation\00"
@.str.exp_nash_equilibrium.59 = private unnamed_addr constant [13 x i8] c"  Error p1: \00"
@.str.exp_nash_equilibrium.60 = private unnamed_addr constant [13 x i8] c", Error p2: \00"
@.str.exp_nash_equilibrium.61 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.62 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.63 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_nash_equilibrium.64 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_nash_equilibrium.65 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_nash_equilibrium.66 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.67 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.68 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.69 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.70 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.71 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.72 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_nash_equilibrium.73 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.74 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_nash_equilibrium.75 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.76 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_nash_equilibrium.77 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_nash_equilibrium.78 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.79 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.80 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.81 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.82 = private unnamed_addr constant [52 x i8] c"--- Exp 1b: Interaction Matrix on Zero-Sum Game ---\00"
@.str.exp_nash_equilibrium.83 = private unnamed_addr constant [63 x i8] c"  Learnable alpha controls gradient projection between players\00"
@.str.exp_nash_equilibrium.84 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.87 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_nash_equilibrium.88 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_nash_equilibrium.89 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.90 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.91 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_nash_equilibrium.92 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_nash_equilibrium.93 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.94 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.95 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_nash_equilibrium.96 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_nash_equilibrium.97 = private unnamed_addr constant [26 x i8] c"  alpha=(0.0, 0.0): dist=\00"
@.str.exp_nash_equilibrium.98 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.99 = private unnamed_addr constant [26 x i8] c"  alpha=(0.3, 0.3): dist=\00"
@.str.exp_nash_equilibrium.100 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.101 = private unnamed_addr constant [26 x i8] c"  alpha=(0.5, 0.5): dist=\00"
@.str.exp_nash_equilibrium.102 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.103 = private unnamed_addr constant [26 x i8] c"  alpha=(0.8, 0.8): dist=\00"
@.str.exp_nash_equilibrium.104 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.105 = private unnamed_addr constant [26 x i8] c"  alpha=(1.0, 1.0): dist=\00"
@.str.exp_nash_equilibrium.106 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.107 = private unnamed_addr constant [26 x i8] c"  alpha=(0.8, 0.2): dist=\00"
@.str.exp_nash_equilibrium.108 = private unnamed_addr constant [15 x i8] c"  (asymmetric)\00"
@.str.exp_nash_equilibrium.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.110 = private unnamed_addr constant [32 x i8] c"  BEST: No projection (alpha=0)\00"
@.str.exp_nash_equilibrium.111 = private unnamed_addr constant [18 x i8] c"  BEST: alpha=0.3\00"
@.str.exp_nash_equilibrium.112 = private unnamed_addr constant [18 x i8] c"  BEST: alpha=0.5\00"
@.str.exp_nash_equilibrium.113 = private unnamed_addr constant [18 x i8] c"  BEST: alpha=0.8\00"
@.str.exp_nash_equilibrium.114 = private unnamed_addr constant [32 x i8] c"  BEST: alpha=1.0 (full PCGrad)\00"
@.str.exp_nash_equilibrium.115 = private unnamed_addr constant [30 x i8] c"  BEST: asymmetric (0.8, 0.2)\00"
@.str.exp_nash_equilibrium.116 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_nash_equilibrium.117 = private unnamed_addr constant [30 x i8] c"  Improvement over baseline: \00"
@.str.exp_nash_equilibrium.118 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_nash_equilibrium.119 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.exp_nash_equilibrium.120 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.121 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_nash_equilibrium.122 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.123 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.124 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.125 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.126 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.127 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_nash_equilibrium.128 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.129 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.130 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.131 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_nash_equilibrium.132 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.133 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.134 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.135 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.136 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_nash_equilibrium.137 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.138 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_nash_equilibrium.139 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.140 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.141 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.142 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.143 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.144 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.145 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_nash_equilibrium.146 = private unnamed_addr constant [59 x i8] c"==========================================================\00"
@.str.exp_nash_equilibrium.147 = private unnamed_addr constant [34 x i8] c"Exp 2: 3-Player Coordination Game\00"
@.str.exp_nash_equilibrium.148 = private unnamed_addr constant [59 x i8] c"==========================================================\00"
@.str.exp_nash_equilibrium.149 = private unnamed_addr constant [34 x i8] c"  Targets: P1=0.2, P2=0.5, P3=0.8\00"
@.str.exp_nash_equilibrium.150 = private unnamed_addr constant [41 x i8] c"  Coordination penalty c * |xi - mean|^2\00"
@.str.exp_nash_equilibrium.151 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.152 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.153 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.154 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.155 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_nash_equilibrium.156 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.157 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.158 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.159 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.160 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.161 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_nash_equilibrium.162 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.163 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_nash_equilibrium.164 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.165 = private unnamed_addr constant [28 x i8] c"  Detailed trace for c=1.0:\00"
@.str.exp_nash_equilibrium.166 = private unnamed_addr constant [48 x i8] c"  Step | x1    | x2    | x3    | mean  | spread\00"
@.str.exp_nash_equilibrium.167 = private unnamed_addr constant [49 x i8] c"  -----|-------|-------|-------|-------|--------\00"
@.str.exp_nash_equilibrium.168 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.169 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.170 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.171 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.172 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.173 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.174 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_nash_equilibrium.175 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_nash_equilibrium.176 = private unnamed_addr constant [6 x i8] c"   | \00"
@.str.exp_nash_equilibrium.177 = private unnamed_addr constant [4 x i8] c" | \00"
@.str.exp_nash_equilibrium.178 = private unnamed_addr constant [4 x i8] c" | \00"
@.str.exp_nash_equilibrium.179 = private unnamed_addr constant [4 x i8] c" | \00"
@.str.exp_nash_equilibrium.180 = private unnamed_addr constant [4 x i8] c" | \00"
@.str.exp_nash_equilibrium.181 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.182 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.183 = private unnamed_addr constant [31 x i8] c"  Coordination strength sweep:\00"
@.str.exp_nash_equilibrium.184 = private unnamed_addr constant [37 x i8] c"  c    | spread | converged-to-mean?\00"
@.str.exp_nash_equilibrium.185 = private unnamed_addr constant [37 x i8] c"  -----|--------|-------------------\00"
@.str.exp_nash_equilibrium.186 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.187 = private unnamed_addr constant [10 x i8] c"  0.0  | \00"
@.str.exp_nash_equilibrium.188 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_nash_equilibrium.189 = private unnamed_addr constant [27 x i8] c" | No (individual targets)\00"
@.str.exp_nash_equilibrium.190 = private unnamed_addr constant [7 x i8] c" | Yes\00"
@.str.exp_nash_equilibrium.191 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_nash_equilibrium.192 = private unnamed_addr constant [10 x i8] c"  0.25 | \00"
@.str.exp_nash_equilibrium.193 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_nash_equilibrium.194 = private unnamed_addr constant [6 x i8] c" | No\00"
@.str.exp_nash_equilibrium.195 = private unnamed_addr constant [13 x i8] c" | Partially\00"
@.str.exp_nash_equilibrium.196 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.197 = private unnamed_addr constant [10 x i8] c"  0.5  | \00"
@.str.exp_nash_equilibrium.198 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_nash_equilibrium.199 = private unnamed_addr constant [6 x i8] c" | No\00"
@.str.exp_nash_equilibrium.200 = private unnamed_addr constant [13 x i8] c" | Partially\00"
@.str.exp_nash_equilibrium.201 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.202 = private unnamed_addr constant [10 x i8] c"  1.0  | \00"
@.str.exp_nash_equilibrium.203 = private unnamed_addr constant [5 x i8] c"0.08\00"
@.str.exp_nash_equilibrium.204 = private unnamed_addr constant [13 x i8] c" | Partially\00"
@.str.exp_nash_equilibrium.205 = private unnamed_addr constant [7 x i8] c" | Yes\00"
@.str.exp_nash_equilibrium.206 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.207 = private unnamed_addr constant [10 x i8] c"  2.0  | \00"
@.str.exp_nash_equilibrium.208 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_nash_equilibrium.209 = private unnamed_addr constant [13 x i8] c" | Partially\00"
@.str.exp_nash_equilibrium.210 = private unnamed_addr constant [32 x i8] c" | Yes (coordination dominates)\00"
@.str.exp_nash_equilibrium.211 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_nash_equilibrium.212 = private unnamed_addr constant [10 x i8] c"  5.0  | \00"
@.str.exp_nash_equilibrium.213 = private unnamed_addr constant [5 x i8] c"0.03\00"
@.str.exp_nash_equilibrium.214 = private unnamed_addr constant [13 x i8] c" | Partially\00"
@.str.exp_nash_equilibrium.215 = private unnamed_addr constant [29 x i8] c" | Yes (strong coordination)\00"
@.str.exp_nash_equilibrium.216 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_nash_equilibrium.217 = private unnamed_addr constant [10 x i8] c"  10.0 | \00"
@.str.exp_nash_equilibrium.218 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_nash_equilibrium.219 = private unnamed_addr constant [13 x i8] c" | Partially\00"
@.str.exp_nash_equilibrium.220 = private unnamed_addr constant [24 x i8] c" | Yes (near consensus)\00"
@.str.exp_nash_equilibrium.221 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.222 = private unnamed_addr constant [13 x i8] c"0.0000000001\00"
@.str.exp_nash_equilibrium.223 = private unnamed_addr constant [26 x i8] c"  Spread ratio c=10/c=0: \00"
@.str.exp_nash_equilibrium.224 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.225 = private unnamed_addr constant [53 x i8] c"  FINDING: Interaction matrix ADAPTS — as c grows,\00"
@.str.exp_nash_equilibrium.226 = private unnamed_addr constant [60 x i8] c"  player gradients become cooperative (aligned toward mean)\00"
@.str.exp_nash_equilibrium.227 = private unnamed_addr constant [35 x i8] c"  and the contraction accelerates.\00"
@.str.exp_nash_equilibrium.228 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.229 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.230 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_nash_equilibrium.231 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.232 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.233 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_nash_equilibrium.234 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.235 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.236 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.237 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.238 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.239 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.240 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.241 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_nash_equilibrium.242 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.243 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.244 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.245 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.246 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.247 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.248 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.249 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.250 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.251 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.252 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_nash_equilibrium.253 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.254 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.255 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.256 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.257 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.258 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.259 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.260 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.261 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.262 = private unnamed_addr constant [6 x i8] c"  p1=\00"
@.str.exp_nash_equilibrium.263 = private unnamed_addr constant [6 x i8] c", p2=\00"
@.str.exp_nash_equilibrium.264 = private unnamed_addr constant [11 x i8] c", welfare=\00"
@.str.exp_nash_equilibrium.265 = private unnamed_addr constant [15 x i8] c", payoff_each=\00"
@.str.exp_nash_equilibrium.266 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.267 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.268 = private unnamed_addr constant [59 x i8] c"==========================================================\00"
@.str.exp_nash_equilibrium.269 = private unnamed_addr constant [48 x i8] c"Exp 3: Prisoner's Dilemma with Skeptical Desire\00"
@.str.exp_nash_equilibrium.270 = private unnamed_addr constant [59 x i8] c"==========================================================\00"
@.str.exp_nash_equilibrium.271 = private unnamed_addr constant [37 x i8] c"  R=3(CC), T=5(DC), S=0(CD), P=1(DD)\00"
@.str.exp_nash_equilibrium.272 = private unnamed_addr constant [36 x i8] c"  Nash = both defect, payoff=1 each\00"
@.str.exp_nash_equilibrium.273 = private unnamed_addr constant [41 x i8] c"  Pareto = both cooperate, payoff=3 each\00"
@.str.exp_nash_equilibrium.274 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.275 = private unnamed_addr constant [26 x i8] c"  No desire (coupling=0):\00"
@.str.exp_nash_equilibrium.276 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_nash_equilibrium.277 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.278 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.279 = private unnamed_addr constant [37 x i8] c"  Cooperative desire (d=1.0, c=0.5):\00"
@.str.exp_nash_equilibrium.280 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_nash_equilibrium.281 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.282 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.283 = private unnamed_addr constant [37 x i8] c"  Cooperative desire (d=1.0, c=1.0):\00"
@.str.exp_nash_equilibrium.284 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_nash_equilibrium.285 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.286 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.287 = private unnamed_addr constant [37 x i8] c"  Cooperative desire (d=1.0, c=2.0):\00"
@.str.exp_nash_equilibrium.288 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_nash_equilibrium.289 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.290 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_nash_equilibrium.291 = private unnamed_addr constant [35 x i8] c"  Skeptical desire (d=0.3, c=1.0):\00"
@.str.exp_nash_equilibrium.292 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_nash_equilibrium.293 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_nash_equilibrium.294 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.295 = private unnamed_addr constant [35 x i8] c"  Defection desire (d=0.0, c=1.0):\00"
@.str.exp_nash_equilibrium.296 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_nash_equilibrium.297 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.298 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.299 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.300 = private unnamed_addr constant [29 x i8] c"  --- Welfare Comparison ---\00"
@.str.exp_nash_equilibrium.301 = private unnamed_addr constant [36 x i8] c"  Nash optimum: welfare = 2.0 (1+1)\00"
@.str.exp_nash_equilibrium.302 = private unnamed_addr constant [38 x i8] c"  Pareto optimum: welfare = 6.0 (3+3)\00"
@.str.exp_nash_equilibrium.303 = private unnamed_addr constant [22 x i8] c"  No desire:         \00"
@.str.exp_nash_equilibrium.304 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.305 = private unnamed_addr constant [22 x i8] c"  Coop desire c=0.5: \00"
@.str.exp_nash_equilibrium.306 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.307 = private unnamed_addr constant [22 x i8] c"  Coop desire c=1.0: \00"
@.str.exp_nash_equilibrium.308 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.309 = private unnamed_addr constant [22 x i8] c"  Coop desire c=2.0: \00"
@.str.exp_nash_equilibrium.310 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.311 = private unnamed_addr constant [22 x i8] c"  Skeptical d=0.3:   \00"
@.str.exp_nash_equilibrium.312 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.313 = private unnamed_addr constant [22 x i8] c"  Defect desire:     \00"
@.str.exp_nash_equilibrium.314 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.315 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.316 = private unnamed_addr constant [51 x i8] c"  FINDING: Cooperative desire improves welfare by \00"
@.str.exp_nash_equilibrium.317 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.318 = private unnamed_addr constant [64 x i8] c"  The 'misaligned' desire (opposing Nash) HELPS social outcome!\00"
@.str.exp_nash_equilibrium.319 = private unnamed_addr constant [62 x i8] c"  FINDING: Even SKEPTICAL cooperation desire beats pure Nash!\00"
@.str.exp_nash_equilibrium.320 = private unnamed_addr constant [69 x i8] c"  This mirrors the skeptical-desire finding from belief experiments:\00"
@.str.exp_nash_equilibrium.321 = private unnamed_addr constant [66 x i8] c"  misalignment with the 'rational' equilibrium improves outcomes.\00"
@.str.exp_nash_equilibrium.322 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.323 = private unnamed_addr constant [51 x i8] c"  --- Coupling Sweep (desire=1.0, cooperative) ---\00"
@.str.exp_nash_equilibrium.324 = private unnamed_addr constant [21 x i8] c"  coupling | welfare\00"
@.str.exp_nash_equilibrium.325 = private unnamed_addr constant [21 x i8] c"  ---------|--------\00"
@.str.exp_nash_equilibrium.326 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.327 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.328 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.329 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_nash_equilibrium.330 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_nash_equilibrium.331 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_nash_equilibrium.332 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_nash_equilibrium.333 = private unnamed_addr constant [9 x i8] c"      | \00"
@.str.exp_nash_equilibrium.334 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.335 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.336 = private unnamed_addr constant [19 x i8] c"  Best coupling = \00"
@.str.exp_nash_equilibrium.337 = private unnamed_addr constant [13 x i8] c", welfare = \00"
@.str.exp_nash_equilibrium.338 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.339 = private unnamed_addr constant [4 x i8] c"6.0\00"
@.str.exp_nash_equilibrium.340 = private unnamed_addr constant [40 x i8] c"  Fraction of Pareto optimum achieved: \00"
@.str.exp_nash_equilibrium.341 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_nash_equilibrium.342 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.exp_nash_equilibrium.343 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.344 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_nash_equilibrium.345 = private unnamed_addr constant [66 x i8] c"  KEY INSIGHT: Desire-driven meta-gradients escape the Nash trap!\00"
@.str.exp_nash_equilibrium.346 = private unnamed_addr constant [70 x i8] c"  The interaction matrix between self-interest and cooperative desire\00"
@.str.exp_nash_equilibrium.347 = private unnamed_addr constant [63 x i8] c"  creates a contraction toward a BETTER equilibrium than Nash.\00"
@.str.exp_nash_equilibrium.348 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.349 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_nash_equilibrium.350 = private unnamed_addr constant [54 x i8] c"  Nash Equilibria via Geometric Contraction Framework\00"
@.str.exp_nash_equilibrium.351 = private unnamed_addr constant [54 x i8] c"  Game theory as multi-objective gradient convergence\00"
@.str.exp_nash_equilibrium.352 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_nash_equilibrium.353 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.354 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_nash_equilibrium.355 = private unnamed_addr constant [54 x i8] c"  Summary: Game Theory / Contraction Framework Bridge\00"
@.str.exp_nash_equilibrium.356 = private unnamed_addr constant [65 x i8] c"================================================================\00"
@.str.exp_nash_equilibrium.357 = private unnamed_addr constant [59 x i8] c"  1. Zero-sum games: player gradients are adversarial. The\00"
@.str.exp_nash_equilibrium.358 = private unnamed_addr constant [62 x i8] c"     interaction matrix detects conflict. Convergence to Nash\00"
@.str.exp_nash_equilibrium.359 = private unnamed_addr constant [51 x i8] c"     requires the contraction metric S to reach 0.\00"
@.str.exp_nash_equilibrium.360 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.361 = private unnamed_addr constant [54 x i8] c"  2. Coordination games: as coupling c increases, the\00"
@.str.exp_nash_equilibrium.362 = private unnamed_addr constant [64 x i8] c"     interaction matrix shifts from adversarial to cooperative.\00"
@.str.exp_nash_equilibrium.363 = private unnamed_addr constant [55 x i8] c"     Player gradients align, accelerating contraction.\00"
@.str.exp_nash_equilibrium.364 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.365 = private unnamed_addr constant [60 x i8] c"  3. Prisoner's Dilemma: Nash = defect, Pareto = cooperate.\00"
@.str.exp_nash_equilibrium.366 = private unnamed_addr constant [62 x i8] c"     A 'skeptical desire' to cooperate (misaligned with Nash)\00"
@.str.exp_nash_equilibrium.367 = private unnamed_addr constant [66 x i8] c"     improves social welfare — mirroring the belief-calibration\00"
@.str.exp_nash_equilibrium.368 = private unnamed_addr constant [48 x i8] c"     finding that skepticism improves accuracy.\00"
@.str.exp_nash_equilibrium.369 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_nash_equilibrium.370 = private unnamed_addr constant [61 x i8] c"  The geometric contraction framework unifies game-theoretic\00"
@.str.exp_nash_equilibrium.371 = private unnamed_addr constant [64 x i8] c"  equilibria with multi-objective optimisation: Nash equilibria\00"
@.str.exp_nash_equilibrium.372 = private unnamed_addr constant [60 x i8] c"  ARE the fixed points of the multi-player contraction map.\00"
@.str.exp_nash_equilibrium.373 = private unnamed_addr constant [65 x i8] c"================================================================\00"
